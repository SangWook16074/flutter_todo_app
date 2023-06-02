import 'package:get/get.dart';

import '../controller/onboard_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardController());
  }
}
