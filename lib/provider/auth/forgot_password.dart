import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(
      String phone, {
        required Function(String verificationId) onCodeSent,
        required Function(FirebaseAuthException e) onVerificationFailed,
      }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          onVerificationFailed(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      // Handle any errors
      onVerificationFailed(FirebaseAuthException(
        code: 'unknown',
        message: e.toString(),
      ));
    }
  }
}
