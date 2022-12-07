import 'package:get/get.dart';
import 'package:yalla_mazad/controller/registration/sign_in_ctrl.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInCtrl());
  }
}
