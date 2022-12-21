import 'package:get/get.dart';

import '../../controller/plans/plans_controller.dart';

class PlansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlansController());
  }
}
