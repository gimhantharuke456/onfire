import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Signup method
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String username,
    required String systemCode,
  }) async {
    try {
      // Check if the user already exists
      final userSnapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        return {'success': false, 'message': 'Username already exists'};
      }

      // Create new user
      await _firestore.collection('users').add({
        'email': email,
        'username': username,
        'systemCode': systemCode,
      });

      return {'success': true, 'message': 'Registration successful'};
    } catch (e) {
      return {'success': false, 'message': 'Registration failed: $e'};
    }
  }

  // Signin method
  Future<Map<String, dynamic>> signIn({
    required String username,
    required String systemCode,
  }) async {
    try {
      // Check if the user exists with the given username and system code
      final userSnapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .where('systemCode', isEqualTo: systemCode)
          .get();

      if (userSnapshot.docs.isEmpty) {
        return {'success': false, 'message': 'Invalid username or system code'};
      }

      return {'success': true, 'message': 'Login successful'};
    } catch (e) {
      return {'success': false, 'message': 'Login failed: $e'};
    }
  }
}
