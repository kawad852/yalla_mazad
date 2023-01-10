import 'package:get/get.dart';
import 'package:yalla_mazad/controller/drawer/privacy_policy_controller.dart';

class PrivacyPolicyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyPolicyController());
  }
}
