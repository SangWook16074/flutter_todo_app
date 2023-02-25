import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/controller/todo_controller.dart';
import 'package:flutter_todo_app/src/data/model/todo_model.dart';
import 'package:get/get.dart';

import '../../data/repository/todo_repository.dart';

class CreatePage extends GetView<TodoController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('할일 추가하기'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_buildCreateTextField('할일'), _buildButton()],
        ),
      ),
    );
  }

  Widget _buildCreateTextField(String label) {
    return GetBuilder<TodoController>(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label : ',
            style: const TextStyle(fontSize: 25),
          ),
          SizedBox(
            width: 200,
            child: TextField(
              controller: controller.controller,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(25)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildButton() {
    return GetBuilder<TodoController>(builder: (context) {
      return ElevatedButton(
          onPressed: () {
            final todoModel =
                TodoModel(todo: controller.controller.text, isDone: false);
            TodoRepository.createTodos(todoModel);
            Get.back();
          },
          child: const Text('추가하기'));
    });
  }
}
