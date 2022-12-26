import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/reset_password/reset_password_new_password_controller.dart';

class ResetPasswordNewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordNewPasswordController());
  }
}
