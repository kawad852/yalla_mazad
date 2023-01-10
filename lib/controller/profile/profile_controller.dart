import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/auth/update_user_image_api.dart';
import '../../model/auth/update_user_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';

class ProfileController extends GetxController {
  static ProfileController get find => Get.find();
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
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
