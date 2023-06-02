import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/data/model/todo_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/firebase_const.dart';
import '../data/repository/todo_repository.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);
  List<TodoModel> get todos => todoList.value;
  final TextEditingController controller = TextEditingController();

  final RxString _today =
      DateFormat('MMM dd yyyy').format(DateTime.now()).toString().obs;

  String get today => _today.value;

  @override
  void onReady() {
    super.onReady();
    todoList.bindStream(TodoRepository.todoProvider());
  }

  // void completeTodo(String id) => TodoRepository.updateIsDone(id);

  void deleteTodo(String id) async {
    await firebaseFirestore.collection('todo').doc(id).delete();
  }

  void createTodos(String todo) async {
    final TodoModel todoModel = TodoModel(
      todo: todo,
      isDone: false,
    );
    await firebaseFirestore.collection('todo').doc().set({
      'todo': todoModel.todo,
      'createTime': Timestamp.now(),
      'isDone': todoModel.isDone,
    });
  }

  void completeTodo(bool? isDone, String id) {
    TodoRepository.updateIsDone(id);
  }

  void showCreatePopUp() {
    Get.dialog(GestureDetector(
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        child: Container(
          width: Get.size.width - 30,
          height: Get.size.width - 30,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'Add New Todo',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'input new todo',
                      focusColor: Colors.black,
                      isDense: true,
                      fillColor: const Color.fromARGB(255, 219, 219, 219),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0)),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
