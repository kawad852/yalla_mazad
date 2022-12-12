import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/phone_number_controller.dart';

class PhoneNumberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneNumberController());
  }
}
