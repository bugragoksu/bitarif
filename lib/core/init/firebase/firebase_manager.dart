import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'IFirebaseManager.dart';
import 'model/firebase_response.dart';

class FirebaseManager extends IFirebaseManager {
  static FirebaseManager _instance;
  static FirebaseManager get instance {
    if (_instance == null) _instance = FirebaseManager._init();
    return _instance;
  }

  FirebaseManager._init();
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseResponse getCurrentUser() {
    FirebaseResponse response = FirebaseResponse();
    if (this._auth.currentUser != null) {
      response.firebaseUser = this._auth.currentUser;
      response.success = true;
    } else {
      response.success = false;
    }
    return response;
  }

  @override
  Future<FirebaseResponse> registerWithEmailAndPassword(
      {String email, String password}) async {
    FirebaseResponse response = FirebaseResponse();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      response.firebaseUser = userCredential.user;
      response.success = true;
      return response;
    } on FirebaseAuthException catch (e) {
      response.success = false;
      response.exception = e;
      return response;
    } catch (e) {
      response.success = false;
      response.errorMessage = e.toString();
      return response;
    }
  }

  @override
  Future<FirebaseResponse> signInWithEmailAndPassword(
      {String email, String password}) async {
    FirebaseResponse response = FirebaseResponse();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      response.firebaseUser = userCredential.user;
      response.success = true;
      return response;
    } on FirebaseAuthException catch (e) {
      response.success = false;
      response.exception = e;
      return response;
    } catch (e) {
      response.success = false;
      response.errorMessage = e.toString();
      return response;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<String> uploadImage(File image) async {
    try {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('userImages/${basename(image.path)}');
      StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      return await storageReference.getDownloadURL();
    } catch (e) {
      return "";
    }
  }
}
