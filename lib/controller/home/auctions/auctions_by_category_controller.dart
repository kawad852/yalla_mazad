import 'package:get/get.dart';
import 'package:yalla_mazad/api/advertisement_by_category/advertisement_by_category_api.dart';

import 'package:yalla_mazad/model/advertisement_by_category/advertisement_by_category_model.dart';

import '../../../api/all_advertisements/all_advertisements_api.dart';
import '../../../model/all_advertisements/all_advertiements_model.dart';

class AuctionsByCategoryController extends GetxController {
  static AuctionsByCategoryController get find => Get.find();

  AdvertisementByCategoryModel? advertisementByCategoryModel;
  late Future<AdvertisementByCategoryModel?> initializeAdsByCategoryFuture;

  @override
  void onInit() {
    initializeAdsByCategoryFuture = fetchAllCategories();
    initializeAllAdsFuture = fetchAllAds();
    super.onInit();
  }

  Future<AdvertisementByCategoryModel?> fetchAllCategories() async {
    ///TODO: change id later
    advertisementByCategoryModel =
        await AdvertisementByCategoryApi().data(categoryId: 1);
    return advertisementByCategoryModel;
  }

  AllAdvertisementsModel? allAdvertisementsModel;
  late Future<AllAdvertisementsModel?> initializeAllAdsFuture;

  Future<AllAdvertisementsModel?> fetchAllAds() async {
    allAdvertisementsModel = await ALlAdvertisementsApi().data();
    return allAdvertisementsModel;
  }
}
