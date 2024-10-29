import 'package:firebase_database/firebase_database.dart';
import 'package:onfire/models/fire.data.dart';

class FireDataService {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('fire_data');

  Future<FireData?> getLatestFireData() async {
    try {
      // Query the last record ordered by timestamp
      final query = _dbRef.orderByChild('timestamp').limitToLast(1);

      final DatabaseEvent event = await query.once();

      if (event.snapshot.value != null) {
        final Map<dynamic, dynamic> data =
            (event.snapshot.value) as Map<dynamic, dynamic>;

        // Since we're limiting to 1, there will be only one entry
        final entry = data.entries.first;
        final String id = entry.key;
        final Map<String, dynamic> value =
            Map<String, dynamic>.from(entry.value as Map);

        return FireData.fromMap(id, value);
      }
      return null;
    } catch (e) {
      print('Error fetching fire data: $e');
      return null;
    }
  }
}
