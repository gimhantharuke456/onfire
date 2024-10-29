// fire_prediction_model.dart
class FirePredictionData {
  final String fireDirection;
  final Map<String, double> sensorTemperatures;

  FirePredictionData({
    required this.fireDirection,
    required this.sensorTemperatures,
  });

  factory FirePredictionData.fromMap(Map<Object?, Object?> map) {
    // Convert sensor temperatures map
    final sensorTemp = map['sensor_temperatures'] as Map<Object?, Object?>;
    Map<String, double> sensorData = {};

    sensorTemp.forEach((key, value) {
      if (key != null && value != null) {
        sensorData[key.toString()] = (value as num).toDouble();
      }
    });

    return FirePredictionData(
      fireDirection: (map['fire_direction'] ?? '').toString(),
      sensorTemperatures: sensorData,
    );
  }
}
