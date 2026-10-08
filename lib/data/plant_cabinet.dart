class PlantCabinet {
  final String plantName;
  final String scientificName;
  final String? imagePath;
  final DateTime savedAt;

  const PlantCabinet({
    required this.plantName,
    required this.scientificName,
    this.imagePath,
    required this.savedAt,
  });

  // Convert the PlantCabinet object into a Map
  // so it can be stored in Hive.
  Map<String, dynamic> toMap() {
    return {
      'plantName': plantName,
      'scientificName': scientificName,
      'imagePath': imagePath,
      'savedAt': savedAt.toIso8601String(),
    };
  }

  // Convert the Hive Map back into a PlantCabinet object.
  factory PlantCabinet.fromMap(Map<dynamic, dynamic> map) {
    return PlantCabinet(
      plantName: map['plantName']?.toString() ?? '',
      scientificName: map['scientificName']?.toString() ?? '',
      imagePath: map['imagePath']?.toString(),
      savedAt:
          DateTime.tryParse(map['savedAt']?.toString() ?? '') ?? DateTime.now(),
    );
  }
}
