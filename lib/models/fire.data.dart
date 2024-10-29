class FireData {
  final double coLevel;
  final String fireType;
  final double humidity;
  final double lpgLevel;
  final double temperature;
  final String timestamp;
  final String id;

  FireData({
    required this.coLevel,
    required this.fireType,
    required this.humidity,
    required this.lpgLevel,
    required this.temperature,
    required this.timestamp,
    required this.id,
  });

  factory FireData.fromMap(String id, Map<String, dynamic> map) {
    print("map $map");
    return FireData(
      id: id,
      coLevel: ((map['co_level'] ?? 0) as num).toDouble(),
      fireType: (map['fire_type'] ?? "") as String,
      humidity: ((map['humidity'] ?? 0) as num).toDouble(),
      lpgLevel: ((map['lpg_level'] ?? 0) as num).toDouble(),
      temperature: ((map['temperature'] ?? 0) as num).toDouble(),
      timestamp: ((map['timestamp'] ?? "") as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'co_level': coLevel,
      'fire_type': fireType,
      'humidity': humidity,
      'lpg_level': lpgLevel,
      'temperature': temperature,
      'timestamp': timestamp,
    };
  }
}
