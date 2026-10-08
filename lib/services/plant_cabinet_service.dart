import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../data/plant_cabinet.dart';

class PlantCabinetService {
  // ============================================================
  // HIVE SETTINGS
  // ============================================================

  static const String _boxName = 'plant_cabinet';

  static Box? _box;

  // ============================================================
  // INITIALIZE HIVE
  // ============================================================

  static Future<void> initialize() async {
    // Initialize Hive for Flutter.
    await Hive.initFlutter();

    // Open the Plant Cabinet box only once.
    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox(_boxName);
    } else {
      _box = Hive.box(_boxName);
    }
  }

  // ============================================================
  // GET HIVE BOX
  // ============================================================

  static Box get _cabinetBox {
    if (_box == null || !_box!.isOpen) {
      throw StateError(
        'PlantCabinetService has not been initialized. '
        'Call PlantCabinetService.initialize() first.',
      );
    }

    return _box!;
  }

  // ============================================================
  // NORMALIZE PLANT NAME
  // ============================================================

  static String _normalizeName(String name) {
    return name.trim().toLowerCase();
  }

  // ============================================================
  // GET ALL SAVED PLANTS
  // ============================================================

  static List<PlantCabinet> getAllPlants() {
    return _cabinetBox.values.map((value) {
      final map = Map<dynamic, dynamic>.from(value as Map);

      return PlantCabinet.fromMap(map);
    }).toList();
  }

  // ============================================================
  // CHECK IF PLANT IS ALREADY SAVED
  // ============================================================

  static bool containsPlant(String plantName) {
    return _cabinetBox.containsKey(_normalizeName(plantName));
  }

  // ============================================================
  // ADD PLANT
  // ============================================================

  static Future<void> addPlant(PlantCabinet plant) async {
    await _cabinetBox.put(_normalizeName(plant.plantName), plant.toMap());
  }

  // ============================================================
  // REMOVE PLANT
  // ============================================================

  static Future<void> removePlant(String plantName) async {
    final key = _normalizeName(plantName);

    final existing = _cabinetBox.get(key);

    // Delete the associated image first.
    if (existing != null && existing is Map) {
      final map = Map<dynamic, dynamic>.from(existing);

      final imagePath = map['imagePath']?.toString();

      if (imagePath != null && imagePath.isNotEmpty) {
        await _deleteImage(imagePath);
      }
    }

    // Remove the plant record from Hive.
    await _cabinetBox.delete(key);
  }

  // ============================================================
  // COPY IMAGE TO PERMANENT APP STORAGE
  // ============================================================

  static Future<String?> copyImageToCabinet(
    File sourceImage,
    String plantName,
  ) async {
    try {
      // Make sure the source image exists.
      if (!await sourceImage.exists()) {
        return null;
      }

      // Get the application's permanent documents directory.
      final appDirectory = await getApplicationDocumentsDirectory();

      // Create a Plant Cabinet folder.
      final cabinetDirectory = Directory('${appDirectory.path}/plant_cabinet');

      if (!await cabinetDirectory.exists()) {
        await cabinetDirectory.create(recursive: true);
      }

      // Make the plant name safe for a filename.
      final safeName = plantName.trim().toLowerCase().replaceAll(
        RegExp(r'[^a-z0-9]+'),
        '_',
      );

      // Create a unique filename.
      final timestamp = DateTime.now().millisecondsSinceEpoch;

      final destinationPath =
          '${cabinetDirectory.path}/'
          '${safeName}_$timestamp.jpg';

      // Copy the image to permanent storage.
      final copiedFile = await sourceImage.copy(destinationPath);

      return copiedFile.path;
    } catch (error) {
      throw Exception('Failed to save cabinet image: $error');
    }
  }

  // ============================================================
  // DELETE STORED IMAGE
  // ============================================================

  static Future<void> _deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);

      if (await file.exists()) {
        await file.delete();
      }
    } catch (_) {
      // Ignore image deletion errors.
      //
      // The plant record can still be removed
      // from the cabinet.
    }
  }

  // ============================================================
  // CLEAR ENTIRE CABINET
  // ============================================================

  static Future<void> clearCabinet() async {
    final plants = getAllPlants();

    // Delete all saved images.
    for (final plant in plants) {
      final imagePath = plant.imagePath;

      if (imagePath != null && imagePath.isNotEmpty) {
        await _deleteImage(imagePath);
      }
    }

    // Delete all Hive records.
    await _cabinetBox.clear();
  }
}
