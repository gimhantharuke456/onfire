import 'package:firebase_database/firebase_database.dart';
import 'package:onfire/models/fire.detection.model.dart';

class FireDetectionService {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('fire_detection_data');

  // Get stream of all fire detection records
  Stream<List<FireDetectionData>> getFireDetectionStream() {
    return _dbRef.onValue.map((event) {
      final data = event.snapshot.value as Map<Object?, Object?>?;
      if (data == null) return [];

      return data.entries.map((entry) {
        return FireDetectionData.fromMap(
          entry.key.toString(),
          entry.value as Map<Object?, Object?>,
        );
      }).toList();
    });
  }

  // Get a single fire detection record
  Future<FireDetectionData?> getFireDetection(String id) async {
    final snapshot = await _dbRef.child(id).get();
    if (!snapshot.exists) return null;

    return FireDetectionData.fromMap(
      id,
      snapshot.value as Map<Object?, Object?>,
    );
  }

  // Update nozzle status
  Future<void> updateNozzleStatus(String id, String status) async {
    await _dbRef.child(id).update({'nozzle_status': status});
  }

  // Update severity label
  Future<void> updateSeverityLabel(String id, String label) async {
    await _dbRef.child(id).update({'severity_label': label});
  }

  // Update all values
  Future<void> updateFireDetection(String id, FireDetectionData data) async {
    await _dbRef.child(id).update(data.toMap());
  }
}
