import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  // Sign Up Method
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String username,
    required String systemCode,
  }) async {
    try {
      // Validate inputs
      if (email.isEmpty || username.isEmpty || systemCode.isEmpty) {
        return {
          'success': false,
          'message': 'Please fill all fields',
        };
      }

      // Check if username is already taken
      final usernameSnapshot = await _database
          .child('users')
          .orderByChild('username')
          .equalTo(username)
          .get();

      if (usernameSnapshot.exists) {
        return {
          'success': false,
          'message': 'Username already exists',
        };
      }

      // Create user with email
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: systemCode, // Using systemCode as initial password
      );

      // Store additional user data in Realtime Database
      await _database.child('users').child(userCredential.user!.uid).set({
        'email': email,
        'username': username,
        'systemCode': systemCode,
        'createdAt': ServerValue.timestamp,
        'lastLogin': ServerValue.timestamp,
      });

      return {
        'success': true,
        'message': 'Registration successful',
        'user': userCredential.user,
      };
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'An account already exists for this email.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        default:
          message = 'An error occurred. Please try again.';
      }
      return {
        'success': false,
        'message': message,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An unexpected error occurred.',
      };
    }
  }

  // Login Method
  Future<Map<String, dynamic>> login({
    required String email,
    required String systemCode,
  }) async {
    try {
      // Validate inputs
      if (email.isEmpty || systemCode.isEmpty) {
        return {
          'success': false,
          'message': 'Please fill all fields',
        };
      }

      // Sign in user
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: systemCode,
      );

      // Update last login timestamp
      await _database.child('users').child(userCredential.user!.uid).update({
        'lastLogin': ServerValue.timestamp,
      });

      return {
        'success': true,
        'message': 'Login successful',
        'user': userCredential.user,
      };
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found for this email.';
          break;
        case 'wrong-password':
          message = 'Wrong password provided.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        case 'user-disabled':
          message = 'This user account has been disabled.';
          break;
        default:
          message = 'An error occurred. Please try again.';
      }
      return {
        'success': false,
        'message': message,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An unexpected error occurred.',
      };
    }
  }

  // Sign Out Method
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
