import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/src/data/model/todo_model.dart';

import '../../constants/firebase_const.dart';

class TodoApi {
  static Stream<List<TodoModel>> todoStream() {
    return firebaseFirestore
        .collection('todo')
        .orderBy('createTime', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> todos = [];
      for (var todo in query.docs) {
        final todoModel =
            TodoModel.fromDocumentSnapshot(documentSnapshot: todo);
        todos.add(todoModel);
      }
      return todos;
    });
  }

  static void updateTodoIsDone(
    String id,
  ) async {
    await firebaseFirestore.collection('todo').doc(id).update({
      'isDone': true,
    });
  }
}
