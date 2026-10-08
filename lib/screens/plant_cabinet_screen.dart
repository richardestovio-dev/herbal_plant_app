import 'dart:io';

import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../data/plant_cabinet.dart';
import '../data/plant_info.dart';
import '../services/herbvision_plant_info_service.dart';
import '../services/plant_cabinet_service.dart';

class PlantCabinetScreen extends StatefulWidget {
  const PlantCabinetScreen({super.key});

  @override
  State<PlantCabinetScreen> createState() => _PlantCabinetScreenState();
}

class _PlantCabinetScreenState extends State<PlantCabinetScreen> {
  List<PlantCabinet> _plants = [];
  List<PlantCabinet> _filteredPlants = [];

  bool _isLoading = true;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _loadPlants();

    _searchController.addListener(_filterPlants);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ============================================================
  // LOAD PLANTS
  // ============================================================

  void _loadPlants() {
    setState(() {
      _isLoading = true;
    });

    try {
      final plants = PlantCabinetService.getAllPlants();

      setState(() {
        _plants = plants;
        _filteredPlants = plants;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });

      _showMessage('Unable to load Plant Cabinet.', isError: true);
    }
  }

  // ============================================================
  // SEARCH
  // ============================================================

  void _filterPlants() {
    final query = _searchController.text.trim().toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredPlants = _plants;
      } else {
        _filteredPlants = _plants.where((plant) {
          return plant.plantName.toLowerCase().contains(query) ||
              plant.scientificName.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  // ============================================================
  // REMOVE PLANT
  // ============================================================

  Future<void> _removePlant(PlantCabinet plant) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove Plant?'),
          content: Text('Remove ${plant.plantName} from your Plant Cabinet?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    try {
      await PlantCabinetService.removePlant(plant.plantName);

      _loadPlants();

      if (!mounted) return;

      _showMessage('${plant.plantName} removed from Plant Cabinet.');
    } catch (error) {
      if (!mounted) return;

      _showMessage('Unable to remove plant.', isError: true);
    }
  }

  // ============================================================
  // OPEN PLANT INFORMATION
  // ============================================================

  void _openPlantInformation(PlantCabinet cabinetPlant) {
    final PlantInfo? plantInfo = HerbVisionPlantInfoService.getPlantInfo(
      cabinetPlant.plantName,
    );

    if (plantInfo == null) {
      _showMessage('Plant information is not available.', isError: true);

      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _PlantInformationSheet(
          plantInfo: plantInfo,
          cabinetPlant: cabinetPlant,
        );
      },
    );
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(String message, {bool isError = false}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? AppColors.error : AppColors.deepGreen,
        ),
      );
  }

  // ============================================================
  // PLANT CARD
  // ============================================================

  Widget _buildPlantCard(PlantCabinet plant) {
    final imagePath = plant.imagePath;

    final hasImage =
        imagePath != null &&
        imagePath.isNotEmpty &&
        File(imagePath).existsSync();

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 14),
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          _openPlantInformation(plant);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // ------------------------------------------------
              // IMAGE
              // ------------------------------------------------

              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: hasImage
                      ? Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildPlaceholder();
                          },
                        )
                      : _buildPlaceholder(),
                ),
              ),

              const SizedBox(width: 14),

              // ------------------------------------------------
              // PLANT INFORMATION
              // ------------------------------------------------
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.plantName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      plant.scientificName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12.5,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 13,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          _formatDate(plant.savedAt),
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 6),

              // ------------------------------------------------
              // REMOVE BUTTON
              // ------------------------------------------------
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  tooltip: 'Remove',
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.error,
                    size: 19,
                  ),
                  onPressed: () {
                    _removePlant(plant);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PLACEHOLDER IMAGE
  // ============================================================

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.surfaceGreen,
      child: const Center(
        child: Icon(
          Icons.local_florist_rounded,
          size: 40,
          color: AppColors.primaryGreen,
        ),
      ),
    );
  }

  // ============================================================
  // DATE FORMAT
  // ============================================================

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '${date.year}-$month-$day';
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _buildEmptyState() {
    final hasSearch = _searchController.text.trim().isNotEmpty;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.surfaceGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_florist_outlined,
                size: 52,
                color: AppColors.primaryGreen,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              hasSearch ? 'No Plants Found' : 'Your Plant Cabinet is Empty',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              hasSearch
                  ? 'Try searching with another plant name.'
                  : 'Save plants from your scan results '
                        'to access their information offline.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13.5,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text('Plant Cabinet'), centerTitle: true),

      body: Column(
        children: [
          // ----------------------------------------------------
          // SEARCH BAR
          // ----------------------------------------------------

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search saved plants...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
              ),
            ),
          ),

          // ----------------------------------------------------
          // CONTENT
          // ----------------------------------------------------
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredPlants.isEmpty
                ? _buildEmptyState()
                : RefreshIndicator(
                    color: AppColors.primaryGreen,
                    onRefresh: () async {
                      _loadPlants();
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      itemCount: _filteredPlants.length,
                      itemBuilder: (context, index) {
                        return _buildPlantCard(_filteredPlants[index]);
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// PLANT INFORMATION BOTTOM SHEET
// ============================================================================

class _PlantInformationSheet extends StatelessWidget {
  final PlantInfo plantInfo;
  final PlantCabinet cabinetPlant;

  const _PlantInformationSheet({
    required this.plantInfo,
    required this.cabinetPlant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ------------------------------------------------
              // HANDLE
              // ------------------------------------------------

              Center(
                child: Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ------------------------------------------------
              // TITLE
              // ------------------------------------------------
              Text(
                plantInfo.commonName,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                plantInfo.scientificName,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 24),

              _section('About', plantInfo.description),

              _section('Health Uses', plantInfo.healthUses.join('\n• ')),

              _section('Parts Used', plantInfo.partsUsed.join('\n• ')),

              _section('Precautions', plantInfo.precautions.join('\n• ')),

              if (plantInfo.reference.isNotEmpty)
                _section('Reference', plantInfo.reference),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              const SizedBox(width: 9),

              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          Text(
            content,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
