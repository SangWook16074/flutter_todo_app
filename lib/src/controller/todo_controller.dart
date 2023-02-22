import 'package:flutter_todo_app/src/data/model/todo_model.dart';
import 'package:flutter_todo_app/src/data/provider/firebase_db.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);
  List<TodoModel> get todos => todoList.value;

  @override
  void onReady() {
    todoList.bindStream(FirebaseDb.todoStream());
    super.onReady();
  }
}
