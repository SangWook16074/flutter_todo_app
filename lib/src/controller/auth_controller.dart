import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/ui/app.dart';
import 'package:flutter_todo_app/src/ui/pages/sign_in.dart';
import 'package:get/get.dart';

import '../constants/firebase_const.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialPage);
  }

  _setInitialPage(User? user) {
    if (user != null) {
      Get.offAll(() => const App());
    } else {
      Get.offAll(() => const Login());
    }
  }

  void resister() async {
    try {
      if (email.text == '') {
        showErrorSnackBar('이메일을 입력하세요');
        return;
      }

      if (password.text == '') {
        showErrorSnackBar('비밀번호를 입력하세요');
        return;
      }
      final newUser = await auth.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      await firebaseFirestore.collection('user').doc(newUser.user!.uid).set({
        'email': email,
      });
    } on FirebaseAuthException {
      showErrorSnackBar('잠시 후에 다시 시도해주세요.');
    } catch (e) {
      print(e.toString());
    }

    email.text = '';
    password.text = '';
  }


  void showErrorSnackBar(String message) {
    Get.snackbar('Error', message,
        snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
  }

  void login() async {
    try {
      if (email.text == '') {
        showErrorSnackBar('이메일을 입력하세요');
        return;
      }

      if (password.text == '') {
        showErrorSnackBar('비밀번호를 입력하세요');
      }
      await auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
    } on FirebaseAuthException {
      showErrorSnackBar('잠시 후에 다시 시도해주세요.');
    }
    email.text = '';
    password.text = '';
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
