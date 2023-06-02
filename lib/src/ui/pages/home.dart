import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/components/empty_list.dart';
import 'package:flutter_todo_app/src/components/todo_item.dart';
import 'package:flutter_todo_app/src/controller/todo_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

class Home extends GetView<TodoController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Obx(
          () => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              controller.today,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 12, 49),
      floatingActionButton: FloatingActionButton.extended(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        backgroundColor: const Color.fromARGB(255, 0, 12, 49),
        onPressed: controller.showCreatePopUp,
        label: const Text('Add New Todo'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Expanded(flex: 2, child: _title()),
          Expanded(flex: 9, child: _todos()),
        ],
      ),
    );
  }

  Widget _todos() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(50, 40),
              topRight: Radius.elliptical(50, 40))),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Today\'s Todos',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          Obx(
            () => (controller.todos.isEmpty)
                ? const Center(
                    child: EmptyList(),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: controller.todos.length,
                        itemBuilder: (context, index) {
                          final todoModel = controller.todos[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: TodoItem(
                              todo: todoModel,
                              onPressed: (value) {
                                controller.completeTodo(
                                  value,
                                  todoModel.documentID!,
                                );
                              },
                            ),
                          );
                        }),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return SizedBox(
      width: 200,
      height: 200,
      child: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_G2wmKm6yAG.json',
          fit: BoxFit.contain),
    );
  }
}
