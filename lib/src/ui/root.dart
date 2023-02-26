import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/ui/pages/login_page.dart';
import 'package:get/get.dart';

import '../constants/firebase_const.dart';
import '../controller/auth_controller.dart';
import 'app.dart';

class Root extends GetView<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (context, user) {
          if (user.hasData) {
            return FutureBuilder(
              future: controller.login(user.data!.uid),
              builder: (context, snapshot) {
                return const App();
              },
            );
          } else {
            return const Login();
          }
        });
  }
}
