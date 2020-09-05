import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail(
      {@required String email, @required String password}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return authResult.user != null;
    } catch (e) {
      return e;
    }
  }
}
