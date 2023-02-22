import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? documentID;
  late String todo;
  late Timestamp createTime;
  late bool isDone;

  TodoModel({
    required this.todo,
    required this.isDone,
  });

  TodoModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    documentID = documentSnapshot.id;
    todo = documentSnapshot['todo'];
    createTime = documentSnapshot['createTime'];
    isDone = documentSnapshot['isDone'];
  }
}
