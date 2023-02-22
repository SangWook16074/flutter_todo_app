import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/src/constants/firebase_const.dart';
import 'package:flutter_todo_app/src/data/model/todo_model.dart';

class FirebaseDb {
  static createTodos(TodoModel todoModel) async {
    await firebaseFirestore.collection('todo').doc().set({
      'todo': todoModel.todo,
      'createTime': Timestamp.now(),
      'isDone': false,
    });
  }

  static Stream<List<TodoModel>> todoStream() {
    return firebaseFirestore
        .collection('todo')
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

  static updateTodoIsDone(
    bool isDone,
    String id,
  ) async {
    await firebaseFirestore.collection('todo').doc(id).update({
      'isDone': !isDone,
    });
  }

  static deleteTodo(String id) async {
    await firebaseFirestore.collection('todo').doc(id).delete();
  }
}
