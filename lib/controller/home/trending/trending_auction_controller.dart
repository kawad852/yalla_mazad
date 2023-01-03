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
  List<PopularAdsList> popularAdsItems = [];

  Future<void> fetchTrendingPage(int pageKey) async {
    try {
      popularAdvertisementModel = await PopularAdsApi().data(pageKey);
      final newItems = popularAdvertisementModel!.data;
      popularAdsItems.addAll(newItems?.toList() ?? []);
      if (newItems!.isEmpty) {
        trendingPagingController.appendLastPage(newItems);
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

    super.onInit();
  }

  PopularAdvertisementModel? popularAdvertisementModel;
  late Future<PopularAdvertisementModel?> initializePopularAdsFuture;
}
