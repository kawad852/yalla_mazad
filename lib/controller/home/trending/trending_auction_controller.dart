import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yalla_mazad/controller/home/home/home_controller.dart';

import '../../../api/popular_advertisement/popular_advertisement_api.dart';
import '../../../model/popular_advertisement/popular_advertisement_model.dart';

class TrendingAuctionController extends GetxController {
  static TrendingAuctionController get find => Get.find();
  PageController pageController = PageController(
    initialPage: HomeController.find.selectedIndex,
  );

  late PagingController<int, PopularAdsList> trendingPagingController;
  PopularAdvertisementModel? popularAdvertisementModel;

  List<PopularAdsList> popularAdsItems = [];

  RxBool isLoading = true.obs;
  bool isFinalPage = false;

  Future<void> fetchTrendingPage(int pageKey) async {
    try {
      popularAdvertisementModel = await PopularAdsApi().data(pageKey);
      final newItems = popularAdvertisementModel!.data;
      popularAdsItems.addAll(newItems?.toList() ?? []);
      isLoading.value = false;
      update();
      if (newItems!.isEmpty) {
        trendingPagingController.appendLastPage(newItems);
        isFinalPage = true;
      } else {
        trendingPagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (e) {
      trendingPagingController.error = e;
    }
  }

  @override
  void onInit() {
    trendingPagingController = PagingController(firstPageKey: 1)
      ..addPageRequestListener((pageKey) {
        fetchTrendingPage(pageKey);
      });
    fetchTrendingPage(1);
    update();
    super.onInit();
  }
}
