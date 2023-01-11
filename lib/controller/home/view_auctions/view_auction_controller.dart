import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/home/home_controller.dart';

import '../../../model/popular_advertisement/popular_advertisement_model.dart';

class ViewAuctionController extends GetxController {
  static ViewAuctionController get find => Get.find();
  PageController pageController = PageController(
    initialPage: HomeController.find.selectedIndex,
  );


  List<PopularAdsList> popularAdsItems = [];

  RxBool isLoading = true.obs;
  bool isFinalPage = false;


  @override
  void onInit() {
   popularAdsItems = Get.arguments;
    super.onInit();
  }
}
