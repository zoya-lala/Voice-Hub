import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to authenticate a user
  static Future<bool> authenticateUser(String username) async {
    try {
      // You can use username to create a dummy email for testing or use your own method
      final email = "$username@domain.com";
      final password = "defaultPassword123";

      // Try signing in the user with Firebase Auth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Return true if the user is authenticated
      return userCredential.user != null;
    } catch (e) {
      // Print the error and return false if something went wrong
      print("Error during authentication: $e");
      return false;
    }
  }
}
