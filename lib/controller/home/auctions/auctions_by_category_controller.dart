import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yalla_mazad/api/advertisement_by_category/advertisement_by_category_api.dart';

import 'package:yalla_mazad/model/advertisement_by_category/advertisement_by_category_model.dart';

import '../../../api/all_advertisements/all_advertisements_api.dart';
import '../../../model/all_advertisements/all_advertiements_model.dart';
import '../home/home_controller.dart';

class AuctionsByCategoryController extends GetxController {
  static AuctionsByCategoryController get find => Get.find();

  AdvertisementByCategoryModel? advertisementByCategoryModel;
  late Future<AdvertisementByCategoryModel?> initializeAdsByCategoryFuture;

  @override
  void onInit() {
    initializeAdsByCategoryFuture = fetchAllCategories();
    allAdsPagingController = PagingController(firstPageKey: 1)
      ..addPageRequestListener((pageKey) {
        fetchAllAdsPage(pageKey);
      });
    super.onInit();
  }

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
  }

  Future<AdvertisementByCategoryModel?> fetchAllCategories() async {
    advertisementByCategoryModel = await AdvertisementByCategoryApi().data(
      categoryId: HomeController.find.category.value,
    );
    return advertisementByCategoryModel;
  }

   AllAdvertisementsModel? allAdvertisementsModel;
}
