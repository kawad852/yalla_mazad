import 'package:get/get.dart';
import 'package:yalla_mazad/api/categories/categories_api.dart';
import 'package:yalla_mazad/api/popular_advertisement/popular_advertisement_api.dart';
import 'package:yalla_mazad/api/slider/slider_spi.dart';
import 'package:yalla_mazad/model/all_advertisements/all_advertiements_model.dart';
import 'package:yalla_mazad/model/categories/categories_model.dart';
import 'package:yalla_mazad/model/popular_advertisement/popular_advertisement_model.dart';
import 'package:yalla_mazad/model/slider/slider_model.dart';

import '../../api/all_advertisements/all_advertisements_api.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();

  CategoriesModel? categoriesModel;
  late Future<CategoriesModel?> initializeCategoriesFuture;

  @override
  void onInit() {
    initializeCategoriesFuture = fetchAllCategories();
    initializeSliderFuture = fetchAllSliders();
    initializePopularAdsFuture = fetchAllPopularAds();
    initializeAllAdsFuture = fetchAllAds();
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
  late Future<PopularAdvertisementModel?> initializePopularAdsFuture;

  Future<PopularAdvertisementModel?> fetchAllPopularAds() async {
    popularAdvertisementModel = await PopularAdsApi().data();
    return popularAdvertisementModel;
  }

  AllAdvertisementsModel? allAdvertisementsModel;
  late Future<AllAdvertisementsModel?> initializeAllAdsFuture;

  Future<AllAdvertisementsModel?> fetchAllAds() async {
    allAdvertisementsModel = await ALlAdvertisementsApi().data();
    return allAdvertisementsModel;
  }
}
