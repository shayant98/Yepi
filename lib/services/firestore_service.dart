import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yepi/models/user_model.dart';

class FirestoreService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future createUser(UserModel user) async {
    try {
      await _userCollection.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String id) async {
    try {
      var userData = await _userCollection.doc(id).get();
      return UserModel.fromMap(userData.data());
    } catch (e) {
      return e.message;
    }
  }
}
