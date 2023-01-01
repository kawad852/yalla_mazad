import 'package:get/get.dart';
import 'package:yalla_mazad/controller/drawer/terms_and_conditions_controller.dart';

class TermsAndConditionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsAndConditionsController());
  }
}
