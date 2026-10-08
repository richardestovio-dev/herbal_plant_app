import 'dart:typed_data';

import 'package:image/image.dart' as img;

class ImageQualityService {
  // Variance of the Laplacian is a heuristic; tune this against real device
  // photos because image size, texture, and camera noise affect the score.
  static const double minimumSharpnessScore = 100;
  static const int _maximumAnalysisDimension = 512;

  static bool isBlurry(Uint8List imageBytes) {
    return laplacianVariance(imageBytes) < minimumSharpnessScore;
  }

  static double laplacianVariance(Uint8List imageBytes) {
    late final img.Image? decoded;
    try {
      decoded = img.decodeImage(imageBytes);
    } catch (error) {
      throw FormatException('Unable to decode the selected image: $error');
    }
    if (decoded == null) {
      throw const FormatException('Unable to decode the selected image.');
    }

    final longestSide = decoded.width > decoded.height
        ? decoded.width
        : decoded.height;
    final resized = longestSide > _maximumAnalysisDimension
        ? img.copyResize(
            decoded,
            width: (decoded.width * _maximumAnalysisDimension / longestSide)
                .round()
                .clamp(1, _maximumAnalysisDimension)
                .toInt(),
            height: (decoded.height * _maximumAnalysisDimension / longestSide)
                .round()
                .clamp(1, _maximumAnalysisDimension)
                .toInt(),
          )
        : decoded;

    if (resized.width < 3 || resized.height < 3) {
      return 0;
    }

    final luminance = List<double>.filled(resized.width * resized.height, 0);
    for (var y = 0; y < resized.height; y++) {
      for (var x = 0; x < resized.width; x++) {
        final pixel = resized.getPixel(x, y);
        luminance[y * resized.width + x] =
            0.299 * pixel.r + 0.587 * pixel.g + 0.114 * pixel.b;
      }
    }

    var sum = 0.0;
    var squaredSum = 0.0;
    var sampleCount = 0;
    for (var y = 1; y < resized.height - 1; y++) {
      for (var x = 1; x < resized.width - 1; x++) {
        final index = y * resized.width + x;
        final laplacian =
            luminance[index - 1] +
            luminance[index + 1] +
            luminance[index - resized.width] +
            luminance[index + resized.width] -
            4 * luminance[index];
        sum += laplacian;
        squaredSum += laplacian * laplacian;
        sampleCount++;
      }
    }

    final mean = sum / sampleCount;
    return (squaredSum / sampleCount) - (mean * mean);
  }
}
