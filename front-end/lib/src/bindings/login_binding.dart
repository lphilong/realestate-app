import 'package:get/get.dart';

import '../features/auth/controllers/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
