import 'package:flutter_test/flutter_test.dart';
import 'package:herbal_plant_app/services/herbvision_plant_info_service.dart';

void main() {
  group('HerbVisionPlantInfoService identification warning', () {
    test(
      'does not warn for a supported plant above the confidence threshold',
      () {
        expect(
          HerbVisionPlantInfoService.getIdentificationWarning(
            'Malunggay',
            HerbVisionPlantInfoService.minimumAcceptedConfidence,
            confidenceThreshold:
                HerbVisionPlantInfoService.minimumAcceptedConfidence,
          ),
          isNull,
        );
      },
    );

    test(
      'warns when the predicted plant is not in the information dataset',
      () {
        expect(
          HerbVisionPlantInfoService.getIdentificationWarning(
            'Unknown plant',
            0.99,
            confidenceThreshold:
                HerbVisionPlantInfoService.minimumAcceptedConfidence,
          ),
          contains('not in HerbVision'),
        );
      },
    );

    test('warns below the configured confidence threshold', () {
      expect(
        HerbVisionPlantInfoService.getIdentificationWarning(
          'Malunggay',
          HerbVisionPlantInfoService.minimumAcceptedConfidence - 0.01,
          confidenceThreshold:
              HerbVisionPlantInfoService.minimumAcceptedConfidence,
        ),
        contains('could not confidently identify'),
      );
    });
  });
}
