import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/controller/onboard_controller.dart';
import 'package:get/get.dart';

import '../../components/gradient_button.dart';

class OnBoard extends GetView<OnBoardController> {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: _title()),
          Expanded(flex: 3, child: _button()),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      padding: const EdgeInsets.only(left: 40, bottom: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 12, 0, 49),
            Color.fromARGB(255, 12, 0, 91),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(120, 30),
              bottomRight: Radius.elliptical(120, 30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'My Todo List',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: Get.size.width * 0.66,
              child: const Text(
                'We\'ll help you manage all your work with ease. Manage your to-dos efficiently!',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Roboto', fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Center(
        child: GradientButton(
          onPressed: controller.moveToMain,
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Get Start',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
