import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomNavigationBarController extends GetxController {
  static CustomNavigationBarController get find => Get.find();
  final PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

}
