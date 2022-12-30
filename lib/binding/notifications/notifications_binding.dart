import 'package:get/get.dart';
import 'package:yalla_mazad/controller/notifications/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsController());
  }
}
