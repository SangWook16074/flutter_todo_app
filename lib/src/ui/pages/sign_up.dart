import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignUp extends GetView<AuthController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('가입 페이지'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAppTitle(),
              const SizedBox(
                height: 40,
              ),
              _buildBody(),
              const SizedBox(
                height: 40,
              ),
              _buildLoginBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Account : '),
            SizedBox(
              width: 250,
              child: TextField(
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                    )),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Password : '),
            SizedBox(
              width: 250,
              child: TextField(
                controller: controller.password,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton.icon(
          onPressed: () {
            controller.resister(
                controller.email.text.trim(), controller.password.text.trim());
            Get.back();
          },
          icon: const Icon(Icons.add),
          label: const Text('회원가입')),
    );
  }

  Widget _buildAppTitle() {
    return Column(
      children: const [
        Text(
          'Hello !',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(
          'this is Todo App',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
