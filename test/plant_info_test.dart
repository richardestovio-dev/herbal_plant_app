import 'package:flutter_test/flutter_test.dart';
import 'package:herbal_plant_app/data/herbvision_class_names.dart';
import 'package:herbal_plant_app/data/plant_info.dart';
import 'package:herbal_plant_app/data/plant_info_tagalog.dart';
import 'package:herbal_plant_app/data/herbvision_plant_data.dart';

void main() {
  group('plant information data', () {
    test('plant names are unique and match the model classes', () {
      final plantNames = plantInfos.map((plant) => plant.commonName).toSet();

      expect(plantNames.length, plantInfos.length);
      expect(plantNames, equals(herbVisionClassNames.toSet()));
      expect(herbVisionClassNames.toSet().length, herbVisionClassNames.length);
      expect(
        herbVisionPlantData.keys.toSet(),
        equals(herbVisionClassNames.toSet()),
      );
      for (final entry in herbVisionPlantData.entries) {
        expect(entry.key, entry.value.commonName);
      }
    });

    test('every plant has its required information', () {
      for (final plant in plantInfos) {
        expect(plant.commonName.trim(), isNotEmpty);
        expect(plant.scientificName.trim(), isNotEmpty);
        expect(plant.description.trim(), isNotEmpty);
        expect(plant.healthUses, isNotEmpty);
        expect(plant.partsUsed, isNotEmpty);
        expect(plant.precautions, isNotEmpty);
        expect(plant.reference.trim(), isNotEmpty);
      }
    });
  });

  group('plant information lookup', () {
    test('matches names without case or surrounding-space sensitivity', () {
      expect(findPlantInfo('  mAlUnGgAy  ')?.commonName, 'Malunggay');
    });

    test('returns null for unknown, empty, and whitespace-only names', () {
      expect(findPlantInfo('not a plant'), isNull);
      expect(findPlantInfo(''), isNull);
      expect(findPlantInfo('   '), isNull);
    });
  });

  group('Tagalog helpers', () {
    test('provides complete Tagalog information for every supported plant', () {
      expect(
        plantInfoTagalog.keys.toSet(),
        equals(plantInfos.map((plant) => plant.commonName).toSet()),
      );

      for (final plant in plantInfos) {
        final description = getPlantDescriptionTagalog(plant);
        final healthUses = getPlantHealthUsesTagalog(plant);
        final partsUsed = getPlantPartsUsedTagalog(plant);
        final precautions = getPlantPrecautionsTagalog(plant);

        expect(description.trim(), isNotEmpty, reason: plant.commonName);
        expect(description, isNot(plant.description), reason: plant.commonName);
        expect(
          healthUses,
          hasLength(plant.healthUses.length),
          reason: plant.commonName,
        );
        expect(
          partsUsed,
          hasLength(plant.partsUsed.length),
          reason: plant.commonName,
        );
        expect(
          precautions,
          hasLength(plant.precautions.length),
          reason: plant.commonName,
        );

        for (var index = 0; index < healthUses.length; index++) {
          expect(
            healthUses[index].trim(),
            isNotEmpty,
            reason: plant.commonName,
          );
          expect(
            healthUses[index],
            isNot(plant.healthUses[index]),
            reason: plant.commonName,
          );
        }
        for (var index = 0; index < partsUsed.length; index++) {
          expect(partsUsed[index].trim(), isNotEmpty, reason: plant.commonName);
          expect(
            partsUsed[index],
            isNot(plant.partsUsed[index]),
            reason: plant.commonName,
          );
        }
        for (var index = 0; index < precautions.length; index++) {
          expect(
            precautions[index].trim(),
            isNotEmpty,
            reason: plant.commonName,
          );
          expect(
            precautions[index],
            isNot(plant.precautions[index]),
            reason: plant.commonName,
          );
        }
      }
    });
  });
}
