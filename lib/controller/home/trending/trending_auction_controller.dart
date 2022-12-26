import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api/popular_advertisement/popular_advertisement_api.dart';
import '../../../model/popular_advertisement/popular_advertisement_model.dart';

class TrendingAuctionController extends GetxController{
  static TrendingAuctionController get find => Get.find();
  PageController pageController = PageController();

  @override
  void onInit() {
    initializePopularAdsFuture = fetchAllPopularAds();
    super.onInit();
  }
  PopularAdvertisementModel? popularAdvertisementModel;
  late Future<PopularAdvertisementModel?> initializePopularAdsFuture;

  Future<PopularAdvertisementModel?> fetchAllPopularAds() async {
    popularAdvertisementModel = await PopularAdsApi().data();
    return popularAdvertisementModel;
  }
}