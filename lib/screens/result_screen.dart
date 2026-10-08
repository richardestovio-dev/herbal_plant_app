import 'dart:io';

import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../data/plant_cabinet.dart';
import '../data/plant_info.dart';
import '../data/scan_history.dart';
import '../services/herbvision_onnx_service.dart';
import '../services/herbvision_plant_info_service.dart';
import '../services/plant_cabinet_service.dart';
import '../services/scan_history_service.dart';
import 'professional_care_reminder.dart';

class ResultScreen extends StatefulWidget {
  final File imageFile;
  final HerbVisionPrediction prediction;

  const ResultScreen({
    super.key,
    required this.imageFile,
    required this.prediction,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // ============================================================
  // STATE
  // ============================================================

  bool _isTagalog = false;
  bool _historySaved = false;
  bool _isInCabinet = false;
  bool _cabinetSaving = false;

  static const double confidenceThreshold =
      HerbVisionPlantInfoService.minimumAcceptedConfidence;

  // ============================================================
  // CONFIDENCE
  // ============================================================

  bool get _isPredictionAccepted {
    return widget.prediction.confidence >= confidenceThreshold;
  }

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    _saveToHistory();

    if (_isPredictionAccepted) {
      _checkCabinetStatus();
    }
  }

  // ============================================================
  // LANGUAGE HELPER
  // ============================================================

  String _text(String english, String tagalog) {
    return _isTagalog ? tagalog : english;
  }

  // ============================================================
  // PLANT INFORMATION
  // ============================================================

  PlantInfo? get _plantInfo {
    return findPlantInfo(widget.prediction.plantName);
  }

  // ============================================================
  // SAVE SCAN HISTORY
  // ============================================================

  Future<void> _saveToHistory() async {
    if (_historySaved) {
      return;
    }

    try {
      final plantInfo = findPlantInfo(widget.prediction.plantName);

      final history = ScanHistory(
        plantName: widget.prediction.plantName,
        scientificName: plantInfo?.scientificName ?? 'Unknown',
        confidence: widget.prediction.confidence,
        scannedAt: DateTime.now(),
      );

      await ScanHistoryService.addHistory(history);

      if (!mounted) {
        return;
      }

      setState(() {
        _historySaved = true;
      });
    } catch (error) {
      debugPrint('Failed to save scan history: $error');
    }
  }

  // ============================================================
  // CHECK CABINET STATUS
  // ============================================================

  Future<void> _checkCabinetStatus() async {
    try {
      final exists = PlantCabinetService.containsPlant(
        widget.prediction.plantName,
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _isInCabinet = exists;
      });
    } catch (error) {
      debugPrint('Failed to check cabinet status: $error');
    }
  }

  // ============================================================
  // ADD / REMOVE FROM PLANT CABINET
  // ============================================================

  Future<void> _toggleCabinet(PlantInfo plantInfo) async {
    if (_cabinetSaving) {
      return;
    }

    setState(() {
      _cabinetSaving = true;
    });

    try {
      // ----------------------------------------------------------
      // REMOVE
      // ----------------------------------------------------------

      if (_isInCabinet) {
        await PlantCabinetService.removePlant(plantInfo.commonName);

        if (!mounted) {
          return;
        }

        setState(() {
          _isInCabinet = false;
          _cabinetSaving = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _text(
                '${plantInfo.commonName} was removed from your Plant Cabinet.',
                '${plantInfo.commonName} ay inalis sa iyong Plant Cabinet.',
              ),
            ),
          ),
        );

        return;
      }

      // ----------------------------------------------------------
      // COPY IMAGE TO LOCAL CABINET STORAGE
      // ----------------------------------------------------------

      final savedImagePath = await PlantCabinetService.copyImageToCabinet(
        widget.imageFile,
        plantInfo.commonName,
      );

      // ----------------------------------------------------------
      // CREATE CABINET OBJECT
      // ----------------------------------------------------------

      final cabinetPlant = PlantCabinet(
        plantName: plantInfo.commonName,
        scientificName: plantInfo.scientificName,
        imagePath: savedImagePath,
        savedAt: DateTime.now(),
      );

      // ----------------------------------------------------------
      // SAVE CABINET OBJECT
      // ----------------------------------------------------------

      await PlantCabinetService.addPlant(cabinetPlant);

      if (!mounted) {
        return;
      }

      setState(() {
        _isInCabinet = true;
        _cabinetSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _text(
              '${plantInfo.commonName} was saved to your Plant Cabinet.',
              '${plantInfo.commonName} ay nai-save sa iyong Plant Cabinet.',
            ),
          ),
        ),
      );
    } catch (error) {
      debugPrint('Plant Cabinet error: $error');

      if (!mounted) {
        return;
      }

      setState(() {
        _cabinetSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.error,
          content: Text(
            _text(
              'Unable to update the Plant Cabinet.',
              'Hindi ma-update ang Plant Cabinet.',
            ),
          ),
        ),
      );
    }
  }

  // ============================================================
  // MAIN BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final prediction = widget.prediction;

    final confidencePercentage = prediction.confidence * 100;

    final isAccepted = _isPredictionAccepted;

    final plantInfo = _plantInfo;

    return Scaffold(
      backgroundColor: AppColors.background,

      // ========================================================
      // APP BAR
      // ========================================================
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,

        title: Text(_text('Identification Result', 'Resulta ng Pagkilala')),

        actions: [
          IconButton(
            tooltip: _text('Switch Language', 'Palitan ang Wika'),
            onPressed: () {
              setState(() {
                _isTagalog = !_isTagalog;
              });
            },
            icon: const Icon(Icons.translate_rounded),
          ),
        ],
      ),

      // ========================================================
      // BODY
      // ========================================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ==================================================
            // IMAGE
            // ==================================================

            _buildImageCard(),

            const SizedBox(height: 20),

            // ==================================================
            // PREDICTION TITLE
            // ==================================================
            _buildSectionTitle(
              _text('Prediction', 'Hula ng Sistema'),
              Icons.auto_awesome_rounded,
            ),

            const SizedBox(height: 10),

            // ==================================================
            // PREDICTION CARD
            // ==================================================
            _buildPredictionCard(confidencePercentage, isAccepted),

            const SizedBox(height: 20),

            // ==================================================
            // LOW CONFIDENCE
            // ==================================================
            if (!isAccepted) ...[
              _buildLowConfidenceNotice(),

              const SizedBox(height: 20),
            ],

            // ==================================================
            // ACCEPTED RESULT
            // ==================================================
            if (isAccepted && plantInfo != null) ...[
              // ------------------------------------------------
              // PLANT INFORMATION
              // ------------------------------------------------

              _buildSectionTitle(
                _text('Plant Information', 'Impormasyon ng Halaman'),
                Icons.local_florist_outlined,
              ),

              const SizedBox(height: 10),

              _buildPlantInformationCard(plantInfo),

              const SizedBox(height: 20),

              // ------------------------------------------------
              // PLANT CABINET
              // ------------------------------------------------
              _buildSectionTitle(
                _text('Plant Cabinet', 'Kabinet ng mga Halaman'),
                Icons.bookmark_outline_rounded,
              ),

              const SizedBox(height: 10),

              _buildCabinetButton(plantInfo),

              const SizedBox(height: 20),

              // ------------------------------------------------
              // ABOUT
              // ------------------------------------------------
              _buildSectionTitle(
                _text('About the Plant', 'Tungkol sa Halaman'),
                Icons.info_outline_rounded,
              ),

              const SizedBox(height: 10),

              // ------------------------------------------------
              // DESCRIPTION
              // ------------------------------------------------
              _buildInformationCard(
                title: _text('Description', 'Paglalarawan'),
                content: _isTagalog
                    ? getPlantDescriptionTagalog(plantInfo)
                    : plantInfo.description,
                icon: Icons.description_outlined,
              ),

              const SizedBox(height: 16),

              // ------------------------------------------------
              // HEALTH USES
              // ------------------------------------------------
              _buildListCard(
                title: _text('Health Uses', 'Mga Gamit sa Kalusugan'),
                items: _isTagalog
                    ? getPlantHealthUsesTagalog(plantInfo)
                    : plantInfo.healthUses,
                icon: Icons.health_and_safety_outlined,
              ),

              const SizedBox(height: 16),

              // ------------------------------------------------
              // PARTS USED
              // ------------------------------------------------
              _buildListCard(
                title: _text('Parts Used', 'Mga Bahaging Ginagamit'),
                items: _isTagalog
                    ? getPlantPartsUsedTagalog(plantInfo)
                    : plantInfo.partsUsed,
                icon: Icons.eco_outlined,
              ),

              const SizedBox(height: 16),

              // ------------------------------------------------
              // PRECAUTIONS
              // ------------------------------------------------
              _buildListCard(
                title: _text('Precautions', 'Mga Pag-iingat'),
                items: _isTagalog
                    ? getPlantPrecautionsTagalog(plantInfo)
                    : plantInfo.precautions,
                icon: Icons.warning_amber_outlined,
              ),

              const SizedBox(height: 16),

              // ------------------------------------------------
              // REFERENCE
              // ------------------------------------------------
              _buildInformationCard(
                title: _text('Reference', 'Sanggunian'),
                content: plantInfo.reference,
                icon: Icons.menu_book_outlined,
              ),

              const SizedBox(height: 24),

              // ------------------------------------------------
              // DATASET NOTICE
              // ------------------------------------------------
              ProfessionalCareReminder(isTagalog: _isTagalog),

              const SizedBox(height: 24),
            ],

            // ==================================================
            // ACCEPTED BUT PLANT INFO NOT FOUND
            // ==================================================
            if (isAccepted && plantInfo == null) ...[
              _buildPlantInfoNotFoundNotice(),

              const SizedBox(height: 24),
            ],

            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.home_rounded),
                label: Text(_text('Back to Home', 'Bumalik sa Home')),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.deepGreen,
                  side: const BorderSide(color: AppColors.darkGreen),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // IMAGE CARD
  // ============================================================

  Widget _buildImageCard() {
    return Container(
      width: double.infinity,
      height: 280,

      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withValues(alpha: 0.07),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      clipBehavior: Clip.antiAlias,

      child: Image.file(
        widget.imageFile,
        fit: BoxFit.cover,

        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 70,
              color: AppColors.textSecondary,
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // PREDICTION CARD
  // ============================================================

  Widget _buildPredictionCard(double confidencePercentage, bool isAccepted) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.surface,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ----------------------------------------------------
          // PLANT NAME
          // ----------------------------------------------------

          Text(
            widget.prediction.plantName,

            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryGreen,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            _text('Predicted plant', 'Natukoy na halaman'),

            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 18),

          // ----------------------------------------------------
          // CONFIDENCE
          // ----------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                _text('Confidence', 'Antas ng Kumpiyansa'),

                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                '${confidencePercentage.toStringAsFixed(2)}%',

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,

                  color: isAccepted ? AppColors.success : AppColors.warning,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ----------------------------------------------------
          // PROGRESS BAR
          // ----------------------------------------------------
          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: LinearProgressIndicator(
              value: predictionConfidence(),

              minHeight: 10,

              backgroundColor: AppColors.surfaceGreen,

              valueColor: AlwaysStoppedAnimation<Color>(
                isAccepted ? AppColors.primaryGreen : AppColors.warning,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            _text(
              'Required confidence: '
                  '${(confidenceThreshold * 100).toStringAsFixed(0)}%',
              'Kinakailangang kumpiyansa: '
                  '${(confidenceThreshold * 100).toStringAsFixed(0)}%',
            ),

            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SAFE CONFIDENCE VALUE
  // ============================================================

  double predictionConfidence() {
    return widget.prediction.confidence.clamp(0.0, 1.0).toDouble();
  }

  // ============================================================
  // LOW CONFIDENCE NOTICE
  // ============================================================

  Widget _buildLowConfidenceNotice() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.10),

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: AppColors.warning.withValues(alpha: 0.35)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: AppColors.warning,
            size: 30,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  _text(
                    'Low Confidence Prediction',
                    'Mababang Kumpiyansa sa Resulta',
                  ),

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.warning,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  _text(
                    'The prediction confidence is below '
                        'the accepted threshold. Plant information '
                        'and Plant Cabinet saving are unavailable '
                        'for this result.',
                    'Ang kumpiyansa sa resulta ay mas mababa '
                        'sa itinakdang threshold. Hindi available '
                        'ang impormasyon ng halaman at pag-save '
                        'sa Plant Cabinet para sa resultang ito.',
                  ),

                  style: const TextStyle(
                    height: 1.5,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PLANT INFO NOT FOUND
  // ============================================================

  Widget _buildPlantInfoNotFoundNotice() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.10),

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: AppColors.warning.withValues(alpha: 0.30)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Icon(Icons.info_outline_rounded, color: AppColors.warning),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              _text(
                'The plant was identified, but no '
                    'additional plant information was found.',
                'Natukoy ang halaman ngunit walang '
                    'karagdagang impormasyon tungkol dito.',
              ),

              style: const TextStyle(
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BASIC PLANT INFORMATION
  // ============================================================

  Widget _buildPlantInformationCard(PlantInfo plantInfo) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.surface,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            plantInfo.commonName,

            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryGreen,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            plantInfo.scientificName,

            style: const TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PLANT CABINET BUTTON
  // ============================================================

  Widget _buildCabinetButton(PlantInfo plantInfo) {
    final saved = _isInCabinet;

    return InkWell(
      onTap: _cabinetSaving ? null : () => _toggleCabinet(plantInfo),

      borderRadius: BorderRadius.circular(20),

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: saved ? AppColors.surfaceGreen : AppColors.surface,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: saved ? AppColors.primaryGreen : AppColors.border,

            width: saved ? 1.5 : 1,
          ),

          boxShadow: [
            BoxShadow(
              color: AppColors.primaryGreen.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            // --------------------------------------------------
            // ICON
            // --------------------------------------------------

            Container(
              width: 48,
              height: 48,

              decoration: const BoxDecoration(
                color: AppColors.surfaceGreen,
                shape: BoxShape.circle,
              ),

              child: _cabinetSaving
                  ? const Padding(
                      padding: EdgeInsets.all(13),

                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: AppColors.primaryGreen,
                      ),
                    )
                  : Icon(
                      saved
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,

                      color: AppColors.primaryGreen,
                    ),
            ),

            const SizedBox(width: 14),

            // --------------------------------------------------
            // TEXT
            // --------------------------------------------------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    saved
                        ? _text(
                            'Saved in Plant Cabinet',
                            'Naka-save sa Plant Cabinet',
                          )
                        : _text(
                            'Save to Plant Cabinet',
                            'I-save sa Plant Cabinet',
                          ),

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryGreen,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    saved
                        ? _text(
                            'Tap to remove this plant.',
                            'I-tap para alisin ang halaman.',
                          )
                        : _text(
                            'Save this plant for offline access.',
                            'I-save ang halaman para sa offline access.',
                          ),

                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // --------------------------------------------------
            // RIGHT ICON
            // --------------------------------------------------
            Icon(
              saved
                  ? Icons.check_circle_rounded
                  : Icons.arrow_forward_ios_rounded,

              size: saved ? 24 : 16,

              color: saved ? AppColors.success : AppColors.primaryGreen,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // INFORMATION CARD
  // ============================================================

  Widget _buildInformationCard({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.surface,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryGreen),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  title,

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            content,

            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LIST CARD
  // ============================================================

  Widget _buildListCard({
    required String title,
    required List<String> items,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.surface,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryGreen),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  title,

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          if (items.isEmpty)
            Text(
              _text('No information available.', 'Walang available na impormasyon.'),
              style: TextStyle(color: AppColors.textSecondary),
            )
          else
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 9),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 7),

                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: AppColors.primaryGreen,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        item,

                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryGreen, size: 23),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            title,

            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryGreen,
            ),
          ),
        ),
      ],
    );
  }
}
