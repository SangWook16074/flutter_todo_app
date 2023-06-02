import 'package:flutter_todo_app/src/binding/todo_binding.dart';
import 'package:flutter_todo_app/src/ui/pages/home.dart';
import 'package:get/get.dart';

class OnBoardController extends GetxController {
  void moveToMain() => Get.to(() => const Home(), binding: AppBinding());
}
