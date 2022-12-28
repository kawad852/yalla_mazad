import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/add_categories_to_user/add_categories_to_user_api.dart';
import 'package:yalla_mazad/api/interests/interests_api.dart';
import 'package:yalla_mazad/binding/plans/plans_binding.dart';
import 'package:yalla_mazad/model/add_categories_to_user/add_categories_to_user_model.dart';
import 'package:yalla_mazad/model/interests/interests_model.dart';
import 'package:yalla_mazad/ui/screens/plans/screens/plans_screen.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../utils/app_constants.dart';

class InterestsController extends GetxController {
  static InterestsController get find => Get.find();
  List<String> selectedInterests = [];
  InterestsModel? interestsModel;
  late Future<InterestsModel?> initializeInterestsFuture;

  @override
  void onInit() {
    initializeInterestsFuture = fetchAllInterests();
    super.onInit();
  }

  Future<InterestsModel?> fetchAllInterests() async {
    interestsModel = await InterestsApi().data();
    return interestsModel;
  }

  AddCategoriesToUserModel? addCategoriesToUserModel;

  Future fetchAddCategoriesData({
    required List<String> categories,
    required BuildContext context,
  }) async {
    Loader.show(context);
    addCategoriesToUserModel = await AddCategoriesToUserApi().data(
      userId: MySharedPreferences.userId.toString(),
      categoriesId: categories,
    );
    if (addCategoriesToUserModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (addCategoriesToUserModel!.code == 200) {
      Get.to(
        () => const PlansScreen(),
        binding: PlansBinding(),
      );
    } else if (addCategoriesToUserModel!.code == 500) {
      Fluttertoast.showToast(msg: 'incorrect'.tr);
    } else {
      Fluttertoast.showToast(msg: addCategoriesToUserModel!.msg!);
    }
    Loader.hide();
  }
}
