import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/reset_password/reset_password_code_controller.dart';

class ResetPasswordCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordCodeController());
  }
}
