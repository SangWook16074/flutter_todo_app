import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/components/custom_text_field.dart';
import 'package:flutter_todo_app/src/components/glass_container.dart';
import 'package:flutter_todo_app/src/constants/image_path.dart';
import 'package:flutter_todo_app/src/controller/todo_controller.dart';
import 'package:get/get.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late TextEditingController todo;

  @override
  void initState() {
    todo = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    todo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePath.background), fit: BoxFit.cover)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: GlassContainer(
                    padding: 10,
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      _header(),
                      const SizedBox(
                        height: 10,
                      ),
                      _body(),
                      const SizedBox(
                        height: 10,
                      ),
                      _btn(),
                    ])),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return const Text(
      '할일 추가하기',
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GlassContainer(
          padding: 0,
          opacity: 0,
          child: CustomTextField(
            controller: todo,
            hintText: 'What is your todo?',
            prefixIcon: const Icon(
              Icons.work,
              color: Colors.white,
            ),
          )),
    );
  }

  Widget _btn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlassContainer(
            padding: 0,
            opacity: 0,
            child: OutlinedButton(
              onPressed: () {
                Get.find<TodoController>().createTodos(todo.text);
                Get.back();
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(100, 50)),
              child: const Text(
                '확인',
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        GlassContainer(
            padding: 0,
            opacity: 0,
            child: OutlinedButton(
              onPressed: () => Get.back(),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(100, 50)),
              child: const Text(
                '취소',
              ),
            )),
      ],
    );
  }
}
