import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onnxruntime/flutter_onnxruntime.dart';
import 'package:image/image.dart' as img;

/// Result returned by the HerbVision AI model.
class HerbVisionPrediction {
  final String plantName;
  final double confidence;
  final int classIndex;

  const HerbVisionPrediction({
    required this.plantName,
    required this.confidence,
    required this.classIndex,
  });

  @override
  String toString() {
    return '$plantName (${(confidence * 100).toStringAsFixed(2)}%)';
  }
}

/// Handles:
/// 1. Loading the HerbVision ConvNeXt-Tiny ONNX model.
/// 2. Loading the 52 class names.
/// 3. Preprocessing images.
/// 4. Running ONNX inference.
/// 5. Converting logits to probabilities.
class HerbVisionOnnxService {
  // ============================================================
  // MODEL ASSETS
  // ============================================================

  /// Current ONNX model used by the app.
  ///
  /// This model contains its weights inside the .onnx file.
  /// It does NOT require a separate .onnx.data file.
  static const String _modelAsset =
      'assets/model/herbvision_convnext_vit.onnx';

  static const String _classNamesAsset = 'assets/model/class_names.json';

  static const String _preprocessingAsset = 'assets/model/preprocessing.json';

  // ============================================================
  // MODEL CONFIGURATION
  // ============================================================

  static const int imageSize = 224;
  static const int numberOfClasses = 52;

  // Experiment A uses ImageNet normalization.
  static const double _meanR = 0.485;
  static const double _meanG = 0.456;
  static const double _meanB = 0.406;

  static const double _stdR = 0.229;
  static const double _stdG = 0.224;
  static const double _stdB = 0.225;

  // ============================================================
  // ONNX STATE
  // ============================================================

  OnnxRuntime? _runtime;
  OrtSession? _session;

  List<String> _classNames = [];

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  List<String> get classNames => List.unmodifiable(_classNames);

  // ============================================================
  // INITIALIZE MODEL
  // ============================================================

  Future<void> initialize() async {
    if (_isInitialized) {
      _log('HerbVision model already initialized.');
      return;
    }

    try {
      _log('==========================================');
      _log('HERBVISION CONVNEXT MODEL INITIALIZATION');
      _log('==========================================');

      // ----------------------------------------------------------
      // Load preprocessing configuration
      // ----------------------------------------------------------

      final preprocessingJson = await rootBundle.loadString(
        _preprocessingAsset,
      );

      final preprocessing = jsonDecode(preprocessingJson);

      if (preprocessing is! Map) {
        throw Exception('Invalid preprocessing.json format.');
      }

      _log('Preprocessing configuration loaded');
      _log('Image size: ${preprocessing['image_size']}');
      _log('Input shape: ${preprocessing['input_shape']}');

      // ----------------------------------------------------------
      // Load class names
      // ----------------------------------------------------------

      final classNamesJson = await rootBundle.loadString(_classNamesAsset);

      final decoded = jsonDecode(classNamesJson);

      if (decoded is List) {
        // Current Experiment A format:
        //
        // [
        //   "Akapulko",
        //   "Aloe Vera",
        //   ...
        //   "Yerba Buena"
        // ]

        _classNames = decoded.map((item) => item.toString()).toList();
      } else if (decoded is Map && decoded['class_names'] is List) {
        // Also support:
        //
        // {
        //   "class_names": [
        //     "Akapulko",
        //     ...
        //   ]
        // }

        _classNames = (decoded['class_names'] as List)
            .map((item) => item.toString())
            .toList();
      } else {
        throw Exception(
          'Invalid class_names.json format. '
          'Expected a JSON array or a "class_names" list.',
        );
      }

      if (_classNames.length != numberOfClasses) {
        throw Exception(
          'Expected $numberOfClasses classes, '
          'but found ${_classNames.length}.',
        );
      }

      _log('Loaded ${_classNames.length} class names');

      // ----------------------------------------------------------
      // Load ONNX Runtime
      // ----------------------------------------------------------

      _log('Creating ONNX Runtime...');

      _runtime = OnnxRuntime();

      _log('Loading self-contained ONNX model...');

      _session = await _runtime!.createSessionFromAsset(_modelAsset);

      _log('ONNX model loaded');
      _log('Model: $_modelAsset');
      _log('Architecture: ConvNeXt-Tiny');
      _log('Classes: $numberOfClasses');
      _log('Input: [1, 3, 224, 224]');
      _log('Output: [1, 52]');
      _log('External .onnx.data file: NOT REQUIRED');

      _isInitialized = true;

      _log('==========================================');
      _log('HERBVISION CONVNEXT MODEL READY');
      _log('==========================================');
    } catch (e, stackTrace) {
      _log('==========================================');
      _log('HERBVISION MODEL INITIALIZATION ERROR');
      _log('==========================================');

      _log('Error: $e');
      _log('Stack trace: $stackTrace');

      _isInitialized = false;

      // Clean up partially initialized runtime.
      try {
        if (_session != null) {
          await _session!.close();
        }
      } catch (_) {}

      _session = null;
      _runtime = null;

      rethrow;
    }
  }

  // ============================================================
  // PREDICT IMAGE
  // ============================================================

  Future<HerbVisionPrediction> predictImage(Uint8List imageBytes) async {
    if (!_isInitialized || _session == null) {
      await initialize();
    }

    _log('==========================================');
    _log('HERBVISION IMAGE PREDICTION');
    _log('==========================================');

    final inputData = await _preprocessImage(imageBytes);

    _log('Image preprocessing complete');
    _log('Input values: ${inputData.length}');

    return predict(inputData);
  }

  // ============================================================
  // IMAGE PREPROCESSING
  // ============================================================

  Future<List<double>> _preprocessImage(Uint8List imageBytes) async {
    final decodedImage = img.decodeImage(imageBytes);

    if (decodedImage == null) {
      throw Exception('Unable to decode the selected image.');
    }

    _log(
      'Original image: ${decodedImage.width} x ${decodedImage.height}',
    );

    // ----------------------------------------------------------
    // Correct phone-camera orientation.
    // ----------------------------------------------------------

    final rgbImage = img.bakeOrientation(decodedImage);

    _log('Image orientation corrected');

    // ----------------------------------------------------------
    // Resize exactly to the training input size:
    //
    // 224 x 224
    // ----------------------------------------------------------

    final resized = img.copyResize(
      rgbImage,
      width: imageSize,
      height: imageSize,
      interpolation: img.Interpolation.linear,
    );

    _log('Image resized to $imageSize x $imageSize');

    // ----------------------------------------------------------
    // Model expects:
    //
    // [1, 3, 224, 224]
    //
    // Channel order:
    // R -> G -> B
    //
    // ImageNet normalization.
    // ----------------------------------------------------------

    final input = List<double>.filled(3 * imageSize * imageSize, 0.0);

    final planeSize = imageSize * imageSize;

    for (int y = 0; y < imageSize; y++) {
      for (int x = 0; x < imageSize; x++) {
        final pixel = resized.getPixel(x, y);

        final r = pixel.r.toDouble() / 255.0;
        final g = pixel.g.toDouble() / 255.0;
        final b = pixel.b.toDouble() / 255.0;

        final index = y * imageSize + x;

        // Red
        input[index] = (r - _meanR) / _stdR;

        // Green
        input[planeSize + index] = (g - _meanG) / _stdG;

        // Blue
        input[(2 * planeSize) + index] = (b - _meanB) / _stdB;
      }
    }

    return input;
  }

  // ============================================================
  // RUN MODEL
  // ============================================================

  Future<HerbVisionPrediction> predict(List<double> inputData) async {
    if (!_isInitialized || _session == null) {
      await initialize();
    }

    const expectedLength = 1 * 3 * imageSize * imageSize;

    if (inputData.length != expectedLength) {
      throw ArgumentError(
        'Invalid input length. '
        'Expected $expectedLength values, '
        'received ${inputData.length}.',
      );
    }

    // ----------------------------------------------------------
    // Create input tensor
    // ----------------------------------------------------------

    final inputTensor = await OrtValue.fromList(inputData, [
      1,
      3,
      imageSize,
      imageSize,
    ]);

    try {
      // --------------------------------------------------------
      // Experiment A ONNX export:
      // input name = "input"
      // --------------------------------------------------------

      final inputs = <String, OrtValue>{'input': inputTensor};

      _log('Running ONNX inference...');

      final outputs = await _session!.run(inputs);

      try {
        // ------------------------------------------------------
        // Experiment A ONNX export:
        // output name = "output"
        // ------------------------------------------------------

        final outputTensor = outputs['output'];

        if (outputTensor == null) {
          throw Exception(
            'ONNX output "output" was not found. '
            'Available outputs: '
            '${outputs.keys.toList()}',
          );
        }

        // ------------------------------------------------------
        // Read output
        // ------------------------------------------------------

        final rawOutput = await outputTensor.asList();

        final logits = _flattenOutput(rawOutput);

        _log('ONNX output flattened: ${logits.length} values');

        if (logits.length != numberOfClasses) {
          throw Exception(
            'Expected $numberOfClasses logits, '
            'but received ${logits.length}.',
          );
        }

        // ------------------------------------------------------
        // Convert logits to probabilities.
        // ------------------------------------------------------

        final probabilities = _softmax(logits);

        // ------------------------------------------------------
        // Find highest probability.
        // ------------------------------------------------------

        int bestIndex = 0;

        for (int i = 1; i < probabilities.length; i++) {
          if (probabilities[i] > probabilities[bestIndex]) {
            bestIndex = i;
          }
        }

        // ------------------------------------------------------
        // Create prediction.
        // ------------------------------------------------------

        final prediction = HerbVisionPrediction(
          plantName: _classNames[bestIndex],
          confidence: probabilities[bestIndex],
          classIndex: bestIndex,
        );

        _log('------------------------------------------');
        _log('Prediction: ${prediction.plantName}');
        _log('Confidence: ${(prediction.confidence * 100).toStringAsFixed(2)}%');
        _log('Class index: ${prediction.classIndex}');
        _log('------------------------------------------');

        return prediction;
      } finally {
        // Dispose output tensors.
        for (final output in outputs.values) {
          output.dispose();
        }
      }
    } finally {
      // Dispose input tensor.
      inputTensor.dispose();
    }
  }

  // ============================================================
  // FLATTEN ONNX OUTPUT
  // ============================================================

  List<double> _flattenOutput(dynamic value) {
    if (value is num) {
      return [value.toDouble()];
    }

    if (value is Float32List) {
      return value.map((number) => number.toDouble()).toList();
    }

    if (value is Float64List) {
      return value.map((number) => number.toDouble()).toList();
    }

    if (value is Int32List) {
      return value.map((number) => number.toDouble()).toList();
    }

    if (value is Int64List) {
      return value.map((number) => number.toDouble()).toList();
    }

    if (value is List) {
      final result = <double>[];

      for (final item in value) {
        result.addAll(_flattenOutput(item));
      }

      return result;
    }

    throw Exception(
      'Unsupported ONNX output type: '
      '${value.runtimeType}',
    );
  }

  // ============================================================
  // SOFTMAX
  // ============================================================

  List<double> _softmax(List<double> logits) {
    if (logits.isEmpty) {
      throw Exception('Cannot calculate softmax from empty logits.');
    }

    // Numerical-stability trick:
    // subtract the largest logit before exp().
    final maxLogit = logits.reduce(math.max);

    final exponentials = logits.map((logit) => math.exp(logit - maxLogit));

    final values = exponentials.toList();

    final sum = values.fold<double>(
      0.0,
      (previous, current) => previous + current,
    );

    if (sum == 0.0 || !sum.isFinite) {
      throw Exception('Invalid softmax result.');
    }

    return values.map((value) => value / sum).toList();
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  Future<void> dispose() async {
    try {
      if (_session != null) {
        await _session!.close();
      }
    } catch (e) {
      _log('Warning while closing ONNX session: $e');
    }

    _session = null;
    _runtime = null;
    _isInitialized = false;

    _log('HerbVision ONNX resources released');
  }

  void _log(String message) {
    if (kDebugMode) {
      debugPrint(message);
    }
  }
}
