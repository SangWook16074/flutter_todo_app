import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/components/glass_container.dart';
import 'package:flutter_todo_app/src/components/status_icon_button.dart';
import 'package:flutter_todo_app/src/controller/todo_controller.dart';
import 'package:flutter_todo_app/src/data/model/todo_model.dart';
import 'package:get/get.dart';

import '../../components/font_text.dart';
import '../../controller/auth_controller.dart';

class Todo extends GetView<TodoController> {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            _header(),
            _todos(),
          ],
        ),
      ),
    );
  }

  Widget _buildTodoItem(TodoModel todoModel) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GlassContainer(
          padding: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                todoModel.todo,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
              ),
              StatusIconButton(
                onPressed: () => controller.updateTodoIsDone(
                    todoModel.isDone, todoModel.documentID!),
                status: (todoModel.isDone) ? Status.DONE : Status.NOTDONE,
              ),
            ],
          )),
    );
  }

  Widget _header() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const FontText(data: 'Today\'s ToDo List', fontSize: 25),
      IconButton(
          onPressed: Get.find<AuthController>().signOut,
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ))
    ]);
  }

  Widget _todos() {
    return Expanded(
        child: ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todoModel = controller.todos[index];
              return _buildTodoItem(todoModel);
            }));
  }
}
