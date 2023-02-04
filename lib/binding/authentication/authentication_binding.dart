import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/sign_in_controller.dart';
import 'package:yalla_mazad/controller/authentication/sign_up_controller.dart';

import '../../controller/authentication/authentication_controller.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => SignUpController());
  }
}
