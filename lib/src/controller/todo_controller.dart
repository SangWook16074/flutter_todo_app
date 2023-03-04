import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/data/model/todo_model.dart';
import 'package:flutter_todo_app/src/data/repository/todo_repository.dart';
import 'package:get/get.dart';

import '../constants/firebase_const.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);
  List<TodoModel> get todos => todoList.value;
  final TextEditingController controller = TextEditingController();

  @override
  void onReady() {
    todoList.bindStream(TodoRepository.todoStream());
    super.onReady();
  }


  void updateTodoIsDone(
    bool isDone,
    String id,
  ) async {
    await firebaseFirestore.collection('todo').doc(id).update({
      'isDone': !isDone,
    });
  }

  void deleteTodo(String id) async {
    await firebaseFirestore.collection('todo').doc(id).delete();
  }

  void createTodos(String todo) async {
    final TodoModel todoModel = TodoModel(todo: todo, isDone: false,);
    await firebaseFirestore.collection('todo').doc().set({
      'todo': todoModel.todo,
      'createTime': Timestamp.now(),
      'isDone': todoModel.isDone,
    });
  }
}
