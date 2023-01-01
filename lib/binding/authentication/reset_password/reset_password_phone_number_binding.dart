import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/reset_password/reset_password_phone_number_controller.dart';

class ResetPasswordPhoneNumberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordPhoneNumberController());
  }
}
