import 'package:get/get.dart';

import '../../controller/drawer/call_us_controller.dart';

class CallUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallUsController());
  }
}
