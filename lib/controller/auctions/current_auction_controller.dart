import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/add_advertisement_to_favorites/add_advertisement_to_favorites_api.dart';
import 'package:yalla_mazad/api/advertisement_detail/advertisement_detail_api.dart';
import 'package:yalla_mazad/model/add_advertisement_to_favorites/add_advertisement_to_favorites_model.dart';
import 'package:yalla_mazad/model/advertisement_details/advertisement_details_model.dart';
import 'package:yalla_mazad/model/create_bid/create_bid_model.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../api/create_bid/create_bid_api.dart';
import '../../api/delete_advertisement_from_favorites/delete_advertisement_from_favorites_api.dart';
import '../../model/delete_advertisement_from_favorites/delete_advertisement_from_favorites_model.dart';
import '../../utils/app_constants.dart';
import '../profile/my_account/my_favorites_controller.dart';

class CurrentAuctionController extends GetxController {
  static CurrentAuctionController get find => Get.find();

  int selectedBidItem = 0;
  int selectedBidAmount = 0;
  int totalPrice = 0;
  int priceOne = 0;
  int priceTwo = 0;
  int priceThree = 0;
  RxString currentPrice = "0".obs;

  AdvertisementDetailsModel? advertisementDetailsModel;
  late Future<AdvertisementDetailsModel?> initializeAdvertisementFuture;

  @override
  void onInit() async {
    String id = Get.arguments[0].toString();
    initializeAdvertisementFuture = fetchAuctionDetails(
      addId: id,
    );
    priceOne = Get.arguments[1];
    priceTwo = Get.arguments[2];
    priceThree = Get.arguments[3];
    selectedBidAmount = priceOne;
    selectedBidItem = 1;
    var items = FirebaseFirestore.instance
        .collection('auctions')
        .doc(id)
        .collection('biddings')
        .orderBy('amount', descending: true)
        .snapshots();
    items.listen((snapshot) {
      currentPrice = snapshot.docs.isNotEmpty
          ? snapshot.docs.first.get('amount').toString().obs
          : "0".obs;
      totalPrice = int.parse(currentPrice.value) + selectedBidAmount;
      update();
      log(totalPrice.toString());
    });

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
      advertisementDetailsModel?.data?.isFavorite = true;
      Fluttertoast.showToast(
        msg: 'added to favorites successfully'.tr,
      );
      bool test = Get.isRegistered<MyFavoritesController>();
      if (test) {
        MyFavoritesController.find.onInit();
        MyFavoritesController.find.update();
      } else {
        Get.put(MyFavoritesController());
        MyFavoritesController.find.onInit();
        MyFavoritesController.find.update();
      }
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

  DeleteAdvertisementFromFavoritesModel? deleteAdvertisementFromFavoritesModel;

  Future fetchDeleteFromFavoritesData({
    required String adId,
    required BuildContext context,
  }) async {
    Loader.show(context);
    deleteAdvertisementFromFavoritesModel =
        await DeleteAdvertisementFromFavoritesApi().data(
      advertisementId: adId,
      userId: MySharedPreferences.userId.toString(),
    );
    if (deleteAdvertisementFromFavoritesModel == null) {
      Fluttertoast.showToast(
        msg: AppConstants.failedMessage,
      );
      Loader.hide();
      return;
    }
    if (deleteAdvertisementFromFavoritesModel!.code == 200) {
      advertisementDetailsModel?.data?.isFavorite = false;
      Fluttertoast.showToast(
        msg: 'removed from favorites successfully'.tr,
      );
      bool test = Get.isRegistered<MyFavoritesController>();
      if (test) {
        MyFavoritesController.find.onInit();
      } else {
        Get.put(MyFavoritesController());
        MyFavoritesController.find.onInit();
      }
    } else if (deleteAdvertisementFromFavoritesModel!.code == 500) {
      Fluttertoast.showToast(
        msg: deleteAdvertisementFromFavoritesModel?.msg ?? 'already here'.tr,
      );
    } else {
      Fluttertoast.showToast(
        msg: deleteAdvertisementFromFavoritesModel!.msg!,
      );
    }
    Loader.hide();
  }

  CreateBidModel? createBidModel;

  Future fetchCreateBidData({
    required String totalPrice,
    required String adId,
    required BuildContext context,
  }) async {
    Loader.show(context);
    createBidModel = await CreateBidApi().data(
      userId: MySharedPreferences.userId.toString(),
      price: totalPrice,
      adId: adId,
    );
    if (createBidModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (createBidModel!.code == 200) {
      Get.back();
      Fluttertoast.showToast(msg: createBidModel!.msg!);
    } else if (createBidModel!.code == 500) {
      Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
    } else {
      Fluttertoast.showToast(msg: createBidModel!.msg!);
    }
    Loader.hide();
  }
}
