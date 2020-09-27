import 'model/firebase_response.dart';

abstract class IFirebaseManager {
  Future<FirebaseResponse> registerWithEmailAndPassword(
      {String email, String password});

  Future<FirebaseResponse> signInWithEmailAndPassword(
      {String email, String password});
  FirebaseResponse getCurrentUser();

  Future<void> signOut();
}
