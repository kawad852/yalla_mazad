import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yalla_mazad/api/my_badges/my_badges_api.dart';
import 'package:yalla_mazad/model/auth/update_user_model.dart';
import 'package:yalla_mazad/model/my_badges/my_badges_model.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../../api/auth/update_user_image_api.dart';
import '../../../utils/app_constants.dart';

class MyAccountController extends GetxController {
  static MyAccountController get find => Get.find();
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  MyBadgesModel? myBadgesModel;
  late Future<MyBadgesModel?> initializeMyBadgesFuture;

  @override
  void onInit() {
    initializeMyBadgesFuture = fetchMyBadges();
    super.onInit();
  }

  Future<MyBadgesModel?> fetchMyBadges() async {
    myBadgesModel = await MyBadgesApi().data();
    return myBadgesModel;
  }

  String? image;

  pickImage(context) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      image = pickedFile.path;
      await fetchUpdateImageData(context: context);
      // log(image!);
    }
  }

  UpdateUserModel? updateUserModel;

  Future fetchUpdateImageData({
    required BuildContext context,
  }) async {
    Loader.show(context);
    updateUserModel = await UpdateUserImageApi().data(
      file: File(image!),
    );
    if (updateUserModel == null) {
      Fluttertoast.showToast(
        msg: AppConstants.failedMessage,
      );
      Loader.hide();
      return;
    }
    if (updateUserModel!.code == 200) {
      MySharedPreferences.image = updateUserModel?.user?.image ?? '';
      update();
      Fluttertoast.showToast(
        msg: updateUserModel!.msg!,
      );
      image = null;
    } else if (updateUserModel!.code == 500) {
      Fluttertoast.showToast(
        msg: AppConstants.failedMessage,
      );
    } else {
      Fluttertoast.showToast(
        msg: updateUserModel!.msg!,
      );
    }
    Loader.hide();
  }
}
