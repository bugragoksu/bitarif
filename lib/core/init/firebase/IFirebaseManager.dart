import 'model/firebase_response.dart';

abstract class IFirebaseManager {
  Future<FirebaseResponse> registerWithEmailAndPassword(
      {String email, String password});
}
