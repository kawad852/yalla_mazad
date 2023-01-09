import 'dart:developer';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yalla_mazad/api/all_tips/all_tips_api.dart';
import 'package:yalla_mazad/api/categories/categories_api.dart';
import 'package:yalla_mazad/api/popular_advertisement/popular_advertisement_api.dart';
import 'package:yalla_mazad/api/slider/slider_spi.dart';
import 'package:yalla_mazad/model/all_advertisements/all_advertiements_model.dart';
import 'package:yalla_mazad/model/all_tips/all_tips_model.dart';
import 'package:yalla_mazad/model/categories/categories_model.dart';
import 'package:yalla_mazad/model/popular_advertisement/popular_advertisement_model.dart';
import 'package:yalla_mazad/model/slider/slider_model.dart';

import '../../../api/all_advertisements/all_advertisements_api.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();
  int selectedIndex = 0;
  MapEntry<String, int> category = const MapEntry('', 0);

  final advancedDrawerController = AdvancedDrawerController();

  CategoriesModel? categoriesModel;
  late Future<CategoriesModel?> initializeCategoriesFuture;

  @override
  void onInit() {
    initializeCategoriesFuture = fetchAllCategories();
    initializeSliderFuture = fetchAllSliders();
    trendingPagingController = PagingController(firstPageKey: 1)
      ..addPageRequestListener((pageKey) {
        log('inside trend listener');
        fetchTrendingPage(pageKey);
      });
    allAdsPagingController = PagingController(firstPageKey: 1)
      ..addPageRequestListener((pageKey) {
        fetchAllAdsPage(pageKey);
      });
    initializeTipsFuture = fetchAllTips();
    super.onInit();
  }

  Future<CategoriesModel?> fetchAllCategories() async {
    categoriesModel = await CategoriesApi().data();
    return categoriesModel;
  }

  SliderModel? sliderModel;
  late Future<SliderModel?> initializeSliderFuture;

  Future<SliderModel?> fetchAllSliders() async {
    sliderModel = await SliderApi().data();
    return sliderModel;
  }

  PopularAdvertisementModel? popularAdvertisementModel;
  late PagingController<int, PopularAdsList> trendingPagingController;
  Future<void> fetchTrendingPage(int pageKey) async {
    try {
      popularAdvertisementModel = await PopularAdsApi().data(pageKey);
      final newItems = popularAdvertisementModel!.data;
      if (newItems!.isEmpty) {
        trendingPagingController.appendLastPage(newItems);
      } else {
        trendingPagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (e) {
      trendingPagingController.error = e;
    }
    update();
  }

  AllAdvertisementsModel? allAdvertisementsModel;
  late PagingController<int, AllAdsList> allAdsPagingController;
  Future<void> fetchAllAdsPage(int pageKey) async {
    try {
      allAdvertisementsModel = await ALlAdvertisementsApi().data(pageKey);
      final newItems = allAdvertisementsModel!.data;
      if (newItems!.isEmpty) {
        allAdsPagingController.appendLastPage(newItems);
      } else {
        allAdsPagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (e) {
      allAdsPagingController.error = e;
    }
    update();
  }

  AllTipsModel? allTipsModel;
  late Future<AllTipsModel?> initializeTipsFuture;

  Future<AllTipsModel?> fetchAllTips() async {
    allTipsModel = await AllTipsApi().data();
    return allTipsModel;
  }

  @override
  void dispose() {
    trendingPagingController.removeListener(() {});
    trendingPagingController.dispose();
    allAdsPagingController.removeListener(() {});
    allAdsPagingController.dispose();
    super.dispose();
  }
}
