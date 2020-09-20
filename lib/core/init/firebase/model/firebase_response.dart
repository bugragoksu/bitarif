import 'package:bitarif/core/extensions/string_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseResponse {
  User firebaseUser;
  FirebaseAuthException exception;
  String errorMessage;
  bool success;

  String getErrorMessage() {
    if (this.exception != null) {
      this.errorMessage = this.exceptionMessageParser(this.exception.code);
    }
    return this.errorMessage;
  }

  String exceptionMessageParser(String errorCode) {
    String message;
    switch (errorCode) {
      case 'email-already-in-use':
        message = "The account already exists for that email".locale;
        break;
      case 'invalid-email':
        message = "Please supply a valid email".locale;
        break;
      case 'weak-password':
        message = "The password provided is too weak".locale;
        break;
      default:
        message = "Something went wrong. Please try again later".locale;
    }
    return message;
  }
}
