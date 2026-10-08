import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../core/theme/app_colors.dart';
import '../services/herbvision_onnx_service.dart';
import '../services/herbvision_plant_info_service.dart';
import '../services/image_quality_service.dart';
import 'result_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker _picker = ImagePicker();

  // HerbVision ONNX inference service.
  final HerbVisionOnnxService _herbVision = HerbVisionOnnxService();

  File? _selectedImage;

  bool _isAnalyzing = false;
  bool _isLoadingModel = false;
  bool _qualityRejected = false;

  String? _errorMessage;

  // ============================================================
  // PICK IMAGE
  // ============================================================

  Future<void> _pickImage() async {
    if (_isAnalyzing || _isLoadingModel) {
      return;
    }

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (pickedFile == null) {
        return;
      }

      if (!mounted) return;

      setState(() {
        _selectedImage = File(pickedFile.path);
        _errorMessage = null;
        _qualityRejected = false;
      });

      // The image is not analyzed automatically.
      // The user must press "Identify Plant".
    } catch (e) {
      debugPrint('Image selection error: $e');

      if (!mounted) return;

      setState(() {
        _errorMessage = 'Unable to select image.';
      });
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
      _errorMessage = null;
    });

    try {
      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION MODEL INITIALIZATION');
      debugPrint('==========================================');

      await _herbVision.initialize();

      debugPrint('✓ HerbVision model initialized.');
      debugPrint('✓ Loaded classes: ${_herbVision.classNames.length}');

      debugPrint('==========================================');
    } catch (e) {
      debugPrint('==========================================');
      debugPrint('HERBVISION MODEL INITIALIZATION ERROR');
      debugPrint('==========================================');
      debugPrint('$e');
      debugPrint('==========================================');

      if (!mounted) return;

      setState(() {
        _errorMessage =
            'Unable to load the HerbVision AI model. Please try again.';
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
  // ANALYZE IMAGE
  // ============================================================

  Future<void> _analyzeImage() async {
    if (_selectedImage == null || _isAnalyzing || _isLoadingModel) {
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _errorMessage = null;
    });

    try {
      // --------------------------------------------------------
      // STEP 1: READ AND CHECK IMAGE QUALITY
      // --------------------------------------------------------

      final imageBytes = await _selectedImage!.readAsBytes();

      if (!mounted) return;

      if (ImageQualityService.isBlurry(imageBytes)) {
        setState(() {
          _qualityRejected = true;
          _errorMessage =
              'This photo appears blurry. Choose a sharper image '
              'before identifying.';
        });

        return;
      }

      // --------------------------------------------------------
      // STEP 2: LOAD THE MODEL
      // --------------------------------------------------------

      await _initializeHerbVision();

      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION IMAGE ANALYSIS');
      debugPrint('==========================================');
      debugPrint('Image path: ${_selectedImage!.path}');
      debugPrint('Image size: ${imageBytes.length} bytes');

      // --------------------------------------------------------
      // STEP 3: RUN ONNX INFERENCE
      // --------------------------------------------------------

      final HerbVisionPrediction prediction = await _herbVision.predictImage(
        imageBytes,
      );

      // --------------------------------------------------------
      // STEP 4: CHECK CONFIDENCE
      // --------------------------------------------------------

      final warning = HerbVisionPlantInfoService.getIdentificationWarning(
        prediction.plantName,
        prediction.confidence,
        confidenceThreshold:
            HerbVisionPlantInfoService.minimumAcceptedConfidence,
      );

      if (warning != null) {
        if (!mounted) return;

        setState(() {
          _qualityRejected = true;
          _errorMessage = warning;
        });

        return;
      }

      // --------------------------------------------------------
      // STEP 5: PRINT PREDICTION INFORMATION
      // --------------------------------------------------------

      debugPrint('==========================================');
      debugPrint('HERBVISION PREDICTION');
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
      // STEP 6: OPEN RESULT SCREEN
      // --------------------------------------------------------

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(imageFile: _selectedImage!, prediction: prediction),
        ),
      );
    } catch (e) {
      debugPrint('');
      debugPrint('==========================================');
      debugPrint('HERBVISION ANALYSIS ERROR');
      debugPrint('==========================================');
      debugPrint('$e');
      debugPrint('==========================================');

      if (!mounted) return;

      setState(() {
        _qualityRejected = e is FormatException;
        _errorMessage = 'Unable to analyze image. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
        });
      }
    }
  }

  // ============================================================
  // CLEAR IMAGE
  // ============================================================

  void _clearImage() {
    if (_isAnalyzing || _isLoadingModel) {
      return;
    }

    setState(() {
      _selectedImage = null;
      _errorMessage = null;
      _qualityRejected = false;
    });
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _herbVision.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Upload Plant')),
      body: SafeArea(child: _buildBody()),
    );
  }

  // ============================================================
  // BODY
  // ============================================================

  Widget _buildBody() {
    final bool busy = _isAnalyzing || _isLoadingModel;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ------------------------------------------------------
          // HEADER
          // ------------------------------------------------------

          const Text(
            'Identify a Herbal Plant',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Upload a clear image of a plant '
            'to let HerbVision identify it.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          // ------------------------------------------------------
          // IMAGE AREA
          // ------------------------------------------------------
          _buildImageArea(),

          const SizedBox(height: 20),

          // ------------------------------------------------------
          // ERROR MESSAGE
          // ------------------------------------------------------
          if (_errorMessage != null) ...[
            _buildErrorMessage(),
            const SizedBox(height: 20),
          ],

          // ------------------------------------------------------
          // CHOOSE IMAGE
          // ------------------------------------------------------
          ElevatedButton.icon(
            onPressed: busy ? null : _pickImage,
            icon: const Icon(Icons.photo_library_outlined),
            label: const Text('Choose Image'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: AppColors.textOnGreen,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          // ------------------------------------------------------
          // IDENTIFY PLANT
          // ------------------------------------------------------
          if (_selectedImage != null) ...[
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: busy || _qualityRejected ? null : _analyzeImage,
              icon: _buildAnalyzeIcon(),
              label: Text(
                _isLoadingModel
                    ? 'Loading AI Model...'
                    : _isAnalyzing
                    ? 'Analyzing...'
                    : 'Identify Plant',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkGreen,
                foregroundColor: AppColors.textOnGreen,
                disabledBackgroundColor: AppColors.primaryGreen.withValues(
                  alpha: 0.45,
                ),
                disabledForegroundColor: AppColors.white.withValues(
                  alpha: 0.70,
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],

          const SizedBox(height: 20),

          // ------------------------------------------------------
          // INFORMATION CARD
          // ------------------------------------------------------
          _buildInformationCard(),
        ],
      ),
    );
  }

  // ============================================================
  // ERROR MESSAGE
  // ============================================================

  Widget _buildErrorMessage() {
    final Color backgroundColor = _qualityRejected
        ? AppColors.warning.withValues(alpha: 0.12)
        : AppColors.error.withValues(alpha: 0.10);

    final Color borderColor = _qualityRejected
        ? AppColors.warning.withValues(alpha: 0.35)
        : AppColors.error.withValues(alpha: 0.25);

    final Color iconColor = _qualityRejected
        ? AppColors.warning
        : AppColors.error;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _qualityRejected
                ? Icons.warning_amber_rounded
                : Icons.error_outline_rounded,
            color: iconColor,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              _errorMessage!,
              style: TextStyle(
                color: iconColor,
                fontSize: 13,
                height: 1.45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INFORMATION CARD
  // ============================================================

  Widget _buildInformationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceGreen,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, color: AppColors.primaryGreen),

          SizedBox(width: 12),

          Expanded(
            child: Text(
              'For better identification, use a clear image '
              'with good lighting and make sure the plant '
              'is clearly visible.',
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
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

  // ============================================================
  // IMAGE AREA
  // ============================================================

  Widget _buildImageArea() {
    // ----------------------------------------------------------
    // NO IMAGE
    // ----------------------------------------------------------

    if (_selectedImage == null) {
      return Container(
        height: 350,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 86,
              height: 86,
              decoration: const BoxDecoration(
                color: AppColors.surfaceGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.image_outlined,
                size: 46,
                color: AppColors.primaryGreen,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'No image selected',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Choose an image from your gallery',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
          ],
        ),
      );
    }

    // ----------------------------------------------------------
    // SELECTED IMAGE
    // ----------------------------------------------------------

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.file(_selectedImage!, fit: BoxFit.contain),
        ),

        // ------------------------------------------------------
        // CLEAR IMAGE
        // ------------------------------------------------------
        Positioned(
          top: 10,
          right: 10,
          child: Material(
            color: Colors.black.withValues(alpha: 0.65),
            shape: const CircleBorder(),
            child: IconButton(
              tooltip: 'Remove image',
              onPressed: isBusy ? null : _clearImage,
              icon: const Icon(Icons.close_rounded, color: AppColors.white),
            ),
          ),
        ),

        // ------------------------------------------------------
        // ANALYSIS OVERLAY
        // ------------------------------------------------------
        if (_isAnalyzing || _isLoadingModel)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.60),
                borderRadius: BorderRadius.circular(20),
              ),
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
      ],
    );
  }

  // ============================================================
  // BUSY STATE HELPER
  // ============================================================

  bool get isBusy => _isAnalyzing || _isLoadingModel;
}
