import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

import 'pages/todo_page.dart';
import 'pages/user_info.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.index.value,
          children: const [
            Todo(),
            UserInfo(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.index.value,
            onTap: controller.changeBottomNav,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: 'User'),
            ]),
      ),
    );
  }
}
