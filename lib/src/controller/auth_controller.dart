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

  void resister(String email, String password) async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firebaseFirestore.collection('user').doc(newUser.user!.uid).set({
        'email': email,
      });
    } on FirebaseAuthException catch (e) {
      print(e.message!);
      showErrorSnackBar(e);
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showErrorSnackBar(e);
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  void showErrorSnackBar(FirebaseAuthException e) {
    Get.snackbar('Error', e.message!, snackPosition: SnackPosition.BOTTOM);
  }
}
