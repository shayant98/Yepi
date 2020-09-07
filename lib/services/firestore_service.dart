import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yepi/models/mood_model.dart';
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

  Future<UserModel> getUser(String id) async {
    try {
      var userData = await _userCollection.doc(id).get();
      return UserModel.fromMap(userData.data());
    } catch (e) {
      return e.message;
    }
  }

  Future<List<MoodModel>> getUserMood(String id) async {
    try {
      var moodData = await _userCollection.doc(id).collection('mood').get();
      if (moodData.docs.isNotEmpty) {
        List<MoodModel> moods = moodData.docs
            .map((QueryDocumentSnapshot snapshot) =>
                MoodModel.fromMap(snapshot.data()))
            .toList();

        return moods;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
