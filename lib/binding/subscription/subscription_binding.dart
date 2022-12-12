import 'package:get/get.dart';
import 'package:yalla_mazad/controller/subscription/subscription_controller.dart';

class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionController());
  }
}
