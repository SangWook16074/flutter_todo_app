import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/ui/pages/todo_page.dart';
import 'package:flutter_todo_app/src/ui/pages/user_info.dart';
import 'package:get/get.dart';

enum PageName { TODO, USER }

class BottomNavController extends GetxController {
  final _index = 0.obs;
  final List<Widget> _page = [
    const Todo(),
    const UserInfo(),
  ];
  get index => _index;
  get page => _page[_index.value];

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.TODO:
        break;
      case PageName.USER:
        break;
    }
    index(value);
  }
}
