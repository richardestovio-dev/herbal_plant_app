import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../services/herbvision_onnx_service.dart';
import '../services/herbvision_plant_info_service.dart';
import '../services/image_quality_service.dart';
import 'result_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  CameraController? _cameraController;

  final HerbVisionOnnxService _herbVision = HerbVisionOnnxService();

  bool _isCameraInitialized = false;
  bool _isTakingPicture = false;
  bool _isLoadingModel = false;
  bool _isAnalyzing = false;
  bool _qualityRejected = false;

  String? _cameraError;
  String? _analysisError;

  File? _capturedImage;

  // ============================================================
  // INIT STATE
  // ============================================================

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // ============================================================
  // CAMERA INITIALIZATION
  // ============================================================

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        if (!mounted) return;

        setState(() {
          _cameraError = 'No camera was found on this device.';
        });

        return;
      }

      CameraDescription selectedCamera = cameras.first;

      for (final camera in cameras) {
        if (camera.lensDirection == CameraLensDirection.back) {
          selectedCamera = camera;
          break;
        }
      }

      final controller = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller.initialize();

      if (!mounted) {
        await controller.dispose();
        return;
      }

      setState(() {
        _cameraController = controller;
        _isCameraInitialized = true;
        _cameraError = null;
      });

      debugPrint('✓ Camera initialized successfully.');
    } catch (e) {
      debugPrint('Camera initialization error: $e');

      if (!mounted) return;

      setState(() {
        _cameraError = 'Unable to initialize camera: $e';
      });
    }
  }

  // ============================================================
  // TAKE PICTURE
  // ============================================================

  Future<void> _takePicture() async {
    if (_cameraController == null ||
        !_cameraController!.value.isInitialized ||
        _isTakingPicture ||
        _isAnalyzing ||
        _isLoadingModel) {
      return;
    }

    setState(() {
      _isTakingPicture = true;
      _analysisError = null;
    });

    try {
      final XFile image = await _cameraController!.takePicture();

      if (!mounted) return;

      setState(() {
        _capturedImage = File(image.path);
        _analysisError = null;
        _qualityRejected = false;
      });

      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION CAMERA IMAGE CAPTURED');
      debugPrint('==========================================');
      debugPrint('Image path: ${image.path}');
      debugPrint('==========================================');
    } catch (e) {
      debugPrint('Camera capture error: $e');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Unable to capture image.'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isTakingPicture = false;
        });
      }
    }
  }

  // ============================================================
  // INITIALIZE HERBVISION MODEL
  // ============================================================

  Future<void> _initializeHerbVision() async {
    if (_herbVision.isInitialized) {
      debugPrint('✓ HerbVision model is already initialized.');
      return;
    }

    if (!mounted) return;

    setState(() {
      _isLoadingModel = true;
      _analysisError = null;
    });

    try {
      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION MODEL INITIALIZATION');
      debugPrint('==========================================');

      await _herbVision.initialize();

      debugPrint('✓ HerbVision model initialized successfully.');

      debugPrint(
        '✓ Loaded classes: '
        '${_herbVision.classNames.length}',
      );

      debugPrint('==========================================');
    } catch (e) {
      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION MODEL INITIALIZATION ERROR');
      debugPrint('==========================================');
      debugPrint('$e');
      debugPrint('==========================================');

      if (!mounted) return;

      setState(() {
        _analysisError = 'Unable to load the HerbVision AI model.\n\n$e';
      });

      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingModel = false;
        });
      }
    }
  }

  // ============================================================
  // ANALYZE PLANT
  // ============================================================

  Future<void> _analyzePlant() async {
    if (_capturedImage == null || _isAnalyzing || _isLoadingModel) {
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _analysisError = null;
    });

    try {
      // --------------------------------------------------------
      // STEP 1: CHECK IMAGE QUALITY
      // --------------------------------------------------------

      final imageBytes = await _capturedImage!.readAsBytes();

      if (ImageQualityService.isBlurry(imageBytes)) {
        if (mounted) {
          setState(() {
            _qualityRejected = true;
            _analysisError =
                'This photo appears blurry. Retake it with the plant '
                'in focus before identifying.';
          });
        }

        return;
      }

      // --------------------------------------------------------
      // STEP 2: INITIALIZE MODEL
      // --------------------------------------------------------

      await _initializeHerbVision();

      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION CAMERA ANALYSIS');
      debugPrint('==========================================');
      debugPrint('Image path: ${_capturedImage!.path}');
      debugPrint('Image size: ${imageBytes.length} bytes');

      // --------------------------------------------------------
      // STEP 3: RUN ONNX INFERENCE
      // --------------------------------------------------------

      final HerbVisionPrediction prediction = await _herbVision.predictImage(
        imageBytes,
      );

      final warning = HerbVisionPlantInfoService.getIdentificationWarning(
        prediction.plantName,
        prediction.confidence,
        confidenceThreshold:
            HerbVisionPlantInfoService.minimumAcceptedConfidence,
      );

      if (warning != null) {
        if (mounted) {
          setState(() {
            _qualityRejected = true;
            _analysisError = warning;
          });
        }

        return;
      }

      // --------------------------------------------------------
      // STEP 4: PRINT PREDICTION
      // --------------------------------------------------------

      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION CAMERA PREDICTION');
      debugPrint('==========================================');
      debugPrint('Plant: ${prediction.plantName}');
      debugPrint(
        'Confidence: '
        '${(prediction.confidence * 100).toStringAsFixed(2)}%',
      );
      debugPrint('Class index: ${prediction.classIndex}');
      debugPrint('==========================================');

      if (!mounted) return;

      // --------------------------------------------------------
      // STEP 5: OPEN RESULT SCREEN
      // --------------------------------------------------------

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(imageFile: _capturedImage!, prediction: prediction),
        ),
      );
    } catch (e) {
      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION CAMERA ANALYSIS ERROR');
      debugPrint('==========================================');
      debugPrint('$e');
      debugPrint('==========================================');

      if (!mounted) return;

      setState(() {
        _qualityRejected = e is FormatException;
        _analysisError = 'Unable to analyze image.\n\n$e';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Unable to analyze image.'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
        });
      }
    }
  }

  // ============================================================
  // RETAKE
  // ============================================================

  void _retakePicture() {
    if (_isAnalyzing || _isLoadingModel) {
      return;
    }

    setState(() {
      _capturedImage = null;
      _analysisError = null;
      _qualityRejected = false;
    });
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _cameraController?.dispose();
    _herbVision.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text('Scan Plant'),
        backgroundColor: Colors.black,
        foregroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),

      body: _buildBody(),
    );
  }

  // ============================================================
  // BODY
  // ============================================================

  Widget _buildBody() {
    // Camera error.
    if (_cameraError != null) {
      return _buildCameraError();
    }

    // Camera loading.
    if (!_isCameraInitialized || _cameraController == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryGreen),
      );
    }

    // Captured image.
    if (_capturedImage != null) {
      return _buildCapturedImage();
    }

    // Camera preview.
    return _buildCameraPreview();
  }

  // ============================================================
  // CAMERA ERROR
  // ============================================================

  Widget _buildCameraError() {
    return Container(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.surfaceGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.primaryGreen,
                  size: 45,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                _cameraError!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 22),

              ElevatedButton.icon(
                onPressed: _initializeCamera,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: AppColors.textOnGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // CAMERA PREVIEW
  // ============================================================

  Widget _buildCameraPreview() {
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(_cameraController!),

        // ------------------------------------------------------
        // SCANNING GUIDE
        // ------------------------------------------------------
        Center(
          child: Container(
            width: 280,
            height: 360,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryGreen, width: 3),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGreen.withValues(alpha: 0.20),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),

        // ------------------------------------------------------
        // INSTRUCTION
        // ------------------------------------------------------
        Positioned(
          left: 20,
          right: 20,
          bottom: 140,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.primaryGreen.withValues(alpha: 0.35),
              ),
            ),
            child: const Text(
              'Place the plant inside the frame and make sure '
              'it is clearly visible.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ),

        // ------------------------------------------------------
        // CAPTURE BUTTON
        // ------------------------------------------------------
        Positioned(
          bottom: 35,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: _isTakingPicture || _isAnalyzing || _isLoadingModel
                  ? null
                  : _takePicture,
              child: Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(color: AppColors.primaryGreen, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: _isTakingPicture
                    ? const Padding(
                        padding: EdgeInsets.all(22),
                        child: CircularProgressIndicator(
                          color: AppColors.primaryGreen,
                          strokeWidth: 3,
                        ),
                      )
                    : const Icon(
                        Icons.camera_alt_rounded,
                        color: AppColors.primaryGreen,
                        size: 32,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CAPTURED IMAGE
  // ============================================================

  Widget _buildCapturedImage() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Captured image.
        Image.file(_capturedImage!, fit: BoxFit.contain),

        // ------------------------------------------------------
        // ERROR MESSAGE
        // ------------------------------------------------------
        if (_analysisError != null)
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: (_qualityRejected ? AppColors.warning : AppColors.error)
                    .withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                _analysisError!,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 13,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

        // ------------------------------------------------------
        // MODEL / ANALYSIS OVERLAY
        // ------------------------------------------------------
        if (_isAnalyzing || _isLoadingModel)
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.60),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      color: AppColors.primaryGreen,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      _isLoadingModel
                          ? 'Loading HerbVision AI...'
                          : 'Analyzing plant...',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      _isLoadingModel
                          ? 'Preparing ConvNeXt model'
                          : 'Please wait...',
                      style: TextStyle(
                        color: AppColors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // ------------------------------------------------------
        // BOTTOM CONTROLS
        // ------------------------------------------------------
        Positioned(
          left: 20,
          right: 20,
          bottom: 25,
          child: Row(
            children: [
              // RETAKE
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _isAnalyzing || _isLoadingModel
                      ? null
                      : _retakePicture,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Retake'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    disabledForegroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.white),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // IDENTIFY
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _isAnalyzing || _isLoadingModel || _qualityRejected
                      ? null
                      : _analyzePlant,
                  icon: _buildAnalyzeIcon(),
                  label: Text(
                    _isLoadingModel
                        ? 'Loading...'
                        : _isAnalyzing
                        ? 'Analyzing...'
                        : 'Identify',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: AppColors.textOnGreen,
                    disabledBackgroundColor: AppColors.primaryGreen.withValues(
                      alpha: 0.45,
                    ),
                    disabledForegroundColor: AppColors.white.withValues(
                      alpha: 0.70,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ANALYZE BUTTON ICON
  // ============================================================

  Widget _buildAnalyzeIcon() {
    if (_isAnalyzing || _isLoadingModel) {
      return const SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.white,
        ),
      );
    }

    return const Icon(Icons.auto_awesome_rounded);
  }
}
