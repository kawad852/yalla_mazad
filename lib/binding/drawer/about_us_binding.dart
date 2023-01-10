import 'package:get/get.dart';
import 'package:yalla_mazad/controller/drawer/about_us_controller.dart';

class AboutUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutUsController());
  }
}
