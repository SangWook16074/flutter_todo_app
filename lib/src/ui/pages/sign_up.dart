import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/components/custom_text_field.dart';
import 'package:flutter_todo_app/src/components/font_text.dart';
import 'package:flutter_todo_app/src/constants/image_path.dart';
import 'package:flutter_todo_app/src/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../../components/glass_container.dart';

class SignUp extends GetView<AuthController> {
  const SignUp({super.key});

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: GlassContainer(
                padding: 30,
                child: Column(
                  children: [
                    _buildBody(),
                    const SizedBox(
                      height: 40,
                    ),
                    _buildLoginBtn(),
                    _backToSignIn(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return GlassContainer(
      padding: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const FontText(data: 'Sign Up', fontSize: 40),
          CustomTextField(
            controller: controller.email,
            hintText: 'email',
            prefixIcon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              controller: controller.password,
              hintText: 'password',
              obscureText: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return GlassContainer(
      padding: 0,
      child: OutlinedButton.icon(
        onPressed: controller.resister,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          '회원가입',
          style: TextStyle(color: Colors.white),
        ),
        style: OutlinedButton.styleFrom(fixedSize: const Size(250, 50)),
      ),
    );
  }

  Widget _backToSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '이미 가입하셨나요?',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Sign In',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
