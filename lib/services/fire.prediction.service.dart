import 'package:firebase_database/firebase_database.dart';
import 'package:onfire/models/fire.prediction.data.model.dart';

class FirePredictionService {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('fire_direction_prediction_data');

  Stream<FirePredictionData> getFirePredictionStream() {
    return _dbRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      return FirePredictionData.fromMap(Map<String, dynamic>.from(data));
    });
  }
}
