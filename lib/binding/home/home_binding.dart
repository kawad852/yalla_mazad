import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/home_controller.dart';
import 'package:yalla_mazad/controller/home/search_controller.dart';

import '../../controller/add_auction/add_auction_controller.dart';
import '../../controller/profile/account_controller.dart';
import '../../controller/profile/edit_password_controller.dart';
import '../../controller/profile/my_subscription_controller.dart';
import '../../controller/profile/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EditPasswordController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => MySubscriptionController());
    Get.lazyPut(() => AddAuctionController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SearchController());
  }
}
