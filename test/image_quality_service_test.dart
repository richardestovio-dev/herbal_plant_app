import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:herbal_plant_app/services/image_quality_service.dart';

Uint8List encodeImage(img.Image image) => Uint8List.fromList(img.encodePng(image));

void main() {
  group('ImageQualityService', () {
    test('flags a uniform image as blurry', () {
      final image = img.Image(width: 64, height: 64);

      expect(ImageQualityService.isBlurry(encodeImage(image)), isTrue);
    });

    test('does not flag a high-detail checkerboard as blurry', () {
      final image = img.Image(width: 64, height: 64);
      for (var y = 0; y < image.height; y++) {
        for (var x = 0; x < image.width; x++) {
          final shade = (x + y).isEven ? 0 : 255;
          image.setPixelRgb(x, y, shade, shade, shade);
        }
      }

      expect(ImageQualityService.isBlurry(encodeImage(image)), isFalse);
    });

    test('reports undecodable image bytes explicitly', () {
      expect(
        () => ImageQualityService.isBlurry(Uint8List.fromList([1, 2, 3])),
        throwsFormatException,
      );
    });
  });
}
