import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String title;
  final String id;
  final String body;
  final bool isPublic;
  final Timestamp date;
  final String user;

  PostModel(
      {this.user, this.title, this.body, this.isPublic, this.date, this.id});

  PostModel.fromMap(QueryDocumentSnapshot snapshot)
      : title = snapshot.data()['title'],
        body = snapshot.data()['body'],
        isPublic = snapshot.data()['public'],
        date = snapshot.data()['date'],
        id = snapshot.id,
        user = snapshot.data()['user'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'public': isPublic,
        'date': date,
        'id': id,
        'user': user,
      };
}
