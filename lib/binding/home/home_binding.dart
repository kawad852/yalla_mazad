import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/home_controller.dart';
import 'package:yalla_mazad/controller/home/search_controller.dart';
import 'package:yalla_mazad/controller/profile/my_account_controller.dart';
import 'package:yalla_mazad/controller/profile/my_auctions_controller.dart';
import 'package:yalla_mazad/controller/profile/my_favorites_controller.dart';

import '../../controller/add_auction/add_auction_controller.dart';
import '../../controller/custom_navigation_bar_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CustomNavigationBarController());


  }
}
