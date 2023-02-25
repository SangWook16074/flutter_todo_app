import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/data/model/todo_model.dart';
import 'package:flutter_todo_app/src/data/repository/todo_repository.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);
  List<TodoModel> get todos => todoList.value;
  final TextEditingController controller = TextEditingController();

  @override
  void onReady() {
    todoList.bindStream(TodoRepository.todoStream());
    super.onReady();
  }
}
