import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/edit_password_controller.dart';
import 'package:yalla_mazad/controller/profile/my_subscription_controller.dart';
import '../../controller/profile/account_controller.dart';
import '../../controller/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    ///TODO:maybe delete it
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EditPasswordController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => MySubscriptionController());
  }
}
