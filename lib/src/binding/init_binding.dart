import 'package:flutter_todo_app/src/controller/auth_controller.dart';
import 'package:flutter_todo_app/src/controller/todo_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodoController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
