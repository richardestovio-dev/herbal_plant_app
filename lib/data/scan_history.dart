class ScanHistory {
  final String plantName;
  final String scientificName;
  final double confidence;
  final DateTime scannedAt;

  const ScanHistory({
    required this.plantName,
    required this.scientificName,
    required this.confidence,
    required this.scannedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'plantName': plantName,
      'scientificName': scientificName,
      'confidence': confidence,
      'scannedAt': scannedAt.toIso8601String(),
    };
  }

  factory ScanHistory.fromJson(Map<String, dynamic> json) {
    return ScanHistory(
      plantName: json['plantName'] as String,
      scientificName: json['scientificName'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      scannedAt: DateTime.parse(json['scannedAt'] as String),
    );
  }
}
