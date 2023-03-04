import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/components/glass_fab.dart';
import 'package:flutter_todo_app/src/controller/bottom_nav_controller.dart';
import 'package:flutter_todo_app/src/ui/pages/create_page.dart';
import 'package:get/get.dart';

import '../constants/image_path.dart';
import 'pages/todo_page.dart';
import 'pages/user_info.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        floatingActionButton: (controller.index.value == 0)
            ? GlassFab(
                onPressed: () =>
                    Get.to(() => const CreatePage()))
            : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePath.background), fit: BoxFit.cover)),
          child: IndexedStack(
            index: controller.index.value,
            children: const [
              Todo(),
              UserInfo(),
              CreatePage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: controller.index.value,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.001),
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeBottomNav,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  activeIcon: Icon(Icons.account_circle_rounded),
                  label: 'User'),
            ]),
      );
    });
  }
}
