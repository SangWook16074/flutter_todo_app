import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/controller/todo_controller.dart';
import 'package:flutter_todo_app/src/data/provider/firebase_db.dart';
import 'package:flutter_todo_app/src/ui/pages/create_page.dart';
import 'package:get/get.dart';

class App extends GetView<TodoController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('flutter todo app'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.to(() => const CreatePage()),
          icon: const Icon(Icons.add),
          label: const Text('추가'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todoModel = controller.todos[index];
              return _buildTodoItem(
                  todoModel.todo, todoModel.isDone, todoModel.documentID!);
            }),
      ),
    );
  }

  Widget _buildTodoItem(String todo, bool isDone, String id) {
    return ListTile(
      title: Text(todo),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () => FirebaseDb.updateTodoIsDone(isDone, id),
              icon: Icon(
                Icons.favorite,
                color: (isDone) ? Colors.grey : Colors.red,
              )),
          IconButton(
              onPressed: () => FirebaseDb.deleteTodo(id),
              icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
