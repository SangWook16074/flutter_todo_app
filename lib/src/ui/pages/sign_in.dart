import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/components/custom_text_field.dart';
import 'package:flutter_todo_app/src/components/font_text.dart';
import 'package:flutter_todo_app/src/components/glass_container.dart';
import 'package:flutter_todo_app/src/constants/image_path.dart';
import 'package:flutter_todo_app/src/controller/auth_controller.dart';
import 'package:flutter_todo_app/src/ui/pages/sign_up.dart';
import 'package:get/get.dart';

class Login extends GetView<AuthController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePath.background), fit: BoxFit.cover),
          ),
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
                    _buildResister(),
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
          const FontText(data: 'Sign In', fontSize: 40),
          CustomTextField(
            controller: controller.email,
            hintText: 'email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: controller.password,
            hintText: 'Password',
            obscureText: true,
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return GlassContainer(
      padding: 0,
      child: OutlinedButton.icon(
        onPressed: controller.login,
        icon: const Icon(Icons.login),
        label: const Text('로그인'),
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white, fixedSize: const Size(250, 50)),
      ),
    );
  }

  Widget _buildResister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '계정이 없으신가요?',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
            onPressed: () {
              Get.to(() => const SignUp());
            },
            child: const Text(
              'Sign Up',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
