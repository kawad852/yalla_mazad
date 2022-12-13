import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/verification_code_controller.dart';

class VerificationCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationCodeController());
  }
}
