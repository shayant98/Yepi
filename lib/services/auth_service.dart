import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/models/user_model.dart';
import 'package:yepi/services/firestore_service.dart';

class AuthService {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      UserCredential authResult = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      await populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String name,
    @required String surname,
    @required String phone,
  }) async {
    try {
      UserCredential authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      _currentUser = UserModel(
          id: authResult.user.uid,
          name: name,
          surname: surname,
          phone: phone,
          email: email);

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser;

    return user != null;
  }

  Future<void> populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
