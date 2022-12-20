import 'package:get/get.dart';

import '../../controller/introduction/iintroduction_controller.dart';

class IntroductionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroductionController());
  }
}
