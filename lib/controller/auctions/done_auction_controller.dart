import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/add_advertisement_to_favorites/add_advertisement_to_favorites_api.dart';
import 'package:yalla_mazad/api/advertisement_detail/advertisement_detail_api.dart';
import 'package:yalla_mazad/model/add_advertisement_to_favorites/add_advertisement_to_favorites_model.dart';
import 'package:yalla_mazad/model/advertisement_details/advertisement_details_model.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../utils/app_constants.dart';

class DoneAuctionController extends GetxController {
  static DoneAuctionController get find => Get.find();

  AdvertisementDetailsModel? advertisementDetailsModel;
  late Future<AdvertisementDetailsModel?> initializeAdvertisementFuture;

  @override
  void onInit() {
    String id = Get.arguments;
    initializeAdvertisementFuture = fetchAuctionDetails(
      addId: id,
    );
    super.onInit();
  }

  Future<AdvertisementDetailsModel?> fetchAuctionDetails(
      {required String addId}) async {
    advertisementDetailsModel = await AdvertisementDetailsApi().data(
      adId: addId,
    );
    return advertisementDetailsModel;
  }

  AddAdvertisementToFavoritesModel? addAdvertisementToFavoritesModel;

  Future fetchAddToFavoritesData({
    required String adId,
    required BuildContext context,
  }) async {
    Loader.show(context);
    addAdvertisementToFavoritesModel =
        await AddAdvertisementToFavoritesApi().data(
      userId: MySharedPreferences.userId.toString(),
      advertisementId: adId,
    );
    if (addAdvertisementToFavoritesModel == null) {
      Fluttertoast.showToast(
        msg: AppConstants.failedMessage,
      );
      Loader.hide();
      return;
    }
    if (addAdvertisementToFavoritesModel!.code == 200) {
      Fluttertoast.showToast(
        msg: 'added to favorites successfully'.tr,
      );
    } else if (addAdvertisementToFavoritesModel!.code == 500) {
      Fluttertoast.showToast(
        msg: addAdvertisementToFavoritesModel?.msg ?? 'already here'.tr,
      );
    } else {
      Fluttertoast.showToast(
        msg: addAdvertisementToFavoritesModel!.msg!,
      );
    }
    Loader.hide();
  }
}
