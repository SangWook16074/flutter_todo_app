import 'package:flutter_todo_app/src/data/repository/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  login(String uid) async {
    var userData = await UserRepository.loginByUid(uid);
    return userData;
  }
}
