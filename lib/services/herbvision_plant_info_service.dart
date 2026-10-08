import '../data/plant_info.dart';

class HerbVisionPlantInfoService {
  static const double minimumAcceptedConfidence = 0.70;

  /// Finds the plant information that matches the model prediction.
  ///
  /// The ONNX model returns the common plant name, for example:
  /// "Malunggay", "Lagundi", "Luya", etc.
  ///
  /// This service looks for that same name in the existing PlantInfo data.
  static PlantInfo? getPlantInfo(String plantName) {
    for (final plant in plantInfos) {
      if (plant.commonName.toLowerCase().trim() ==
          plantName.toLowerCase().trim()) {
        return plant;
      }
    }

    return null;
  }

  /// Returns a warning when the prediction should not be presented as an
  /// identification. A low score can indicate an unclear image or a plant
  /// outside the model's supported classes; it cannot prove either cause.
  static String? getIdentificationWarning(
    String plantName,
    double confidence, {
    required double confidenceThreshold,
  }) {
    if (getPlantInfo(plantName) == null) {
      return "This plant is not in HerbVision's supported plant dataset. "
          'Choose another image of a supported plant.';
    }

    if (confidence < confidenceThreshold) {
      return 'HerbVision could not confidently identify this image. '
          'The plant may be outside the supported dataset or the image may '
          'be unclear. Choose another image and try again.';
    }

    return null;
  }
}
