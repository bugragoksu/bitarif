import 'package:bitarif/core/extensions/string_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseResponse {
  User firebaseUser;
  FirebaseAuthException exception;
  String errorMessage;
  bool success;
  bool isNewUser;

  FirebaseResponse(
      {this.firebaseUser,
      this.exception,
      this.errorMessage,
      this.success,
      this.isNewUser});

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
        message = "emailAlreadyInUse".locale;
        break;
      case 'invalid-email':
        message = "invalidEmail".locale;
        break;
      case 'weak-password':
        message = "weakPassword".locale;
        break;
      case 'user-not-found':
        message = "userNotFound".locale;
        break;
      case 'wrong-password':
        message = "wrongPassword".locale;
        break;
      case 'account-exists-with-different-credential':
        message = "accountExistDiffCred".locale;
        break;
      default:
        message = "somethingWentWrong".locale;
    }
    return message;
  }
}
