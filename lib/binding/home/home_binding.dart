import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/home/home_controller.dart';

import '../../controller/home/custom_navigation_bar_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CustomNavigationBarController());
  }
}
