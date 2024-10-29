class FireDetectionData {
  final String id;
  final double distanceToFire;
  final String nozzleStatus;
  final String severityLabel;
  final double severityValue;
  final String timestamp;

  FireDetectionData({
    required this.id,
    required this.distanceToFire,
    required this.nozzleStatus,
    required this.severityLabel,
    required this.severityValue,
    required this.timestamp,
  });

  factory FireDetectionData.fromMap(String docId, Map<Object?, Object?> map) {
    return FireDetectionData(
      id: docId,
      distanceToFire: (map['distance_to_fire'] as num).toDouble(),
      nozzleStatus: (map['nozzle_status'] ?? '').toString(),
      severityLabel: (map['severity_label'] ?? '').toString(),
      severityValue: (map['severity_value'] as num).toDouble(),
      timestamp: (map['timestamp'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'distance_to_fire': distanceToFire,
      'nozzle_status': nozzleStatus,
      'severity_label': severityLabel,
      'severity_value': severityValue,
      'timestamp': timestamp,
    };
  }
}
