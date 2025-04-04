import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      // Cek apakah email sudah diverifikasi
      if (user != null && !user.emailVerified) {
        await _firebaseAuth.signOut();
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'Silakan Verifkasi Email dahulu',
        );
      }

      return credential;
    } catch (e) {
      rethrow;
    }
  }
}
