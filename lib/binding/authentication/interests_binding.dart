import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/interests_controller.dart';

class InterestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestsController());
  }
}
