import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/registration/sign_in_api.dart';
import 'package:yalla_mazad/utils/app_constants.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../model/auth/sign_in_model.dart';

class SignInController extends GetxController {
  static SignInController get find => Get.find();

  SignInModel? signInModel;

  Future fetchSignInData({
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    Loader.show(context);
    // OverLayLoader.showLoading(context);
    signInModel = await SignInApi().data(phone: phone, password: password);
    if (signInModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (signInModel!.code == 200) {
      MySharedPreferences.accessToken = signInModel!.data!.token!;
      MySharedPreferences.email = signInModel!.data!.user!.email!;
      MySharedPreferences.name = signInModel!.data!.user!.name!;
      MySharedPreferences.userId = signInModel!.data!.user!.id!;
      MySharedPreferences.image = signInModel!.data!.user!.image!;
      //MySharedPreferences.phone = signInModel!.data!.user!.phone!;
      MySharedPreferences.isLogIn = true;
      // Get.offAll(() => const BaseNavBar(), binding: NavBarBinding());
    } else if (signInModel!.code == 500) {
      Fluttertoast.showToast(msg: 'Incorrect email or password'.tr);
    } else {
      Fluttertoast.showToast(msg: signInModel!.msg!);
    }
    Loader.hide();
  }
}

// class OffersController extends GetxController {
//   static OffersController get find => Get.find();
//
//   OffersModel? offersModel;
//   late Future<OffersModel?> initializeOffersFuture;
//
//   Future<OffersModel?> fetchOffersData() async {
//     offersModel = await OffersApi.data();
//     return offersModel;
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     initializeOffersFuture = fetchOffersData();
//   }
// }

// FutureBuilder<SliderModel?>(
// future: SliderController.find.initializeSliderFuture,
// builder: (context, snapshot) {
// switch (snapshot.connectionState) {
// case ConnectionState.waiting:
// return const CategoryLoading();
// case ConnectionState.done:
// default:
// if (snapshot.hasData) {
// return // your widget;
// } else if (snapshot.hasError) {
// return const FailedWidget();
// } else {
// return const FailedWidget();
// }
// }
// },
// )
