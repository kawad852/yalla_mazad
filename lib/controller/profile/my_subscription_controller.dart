import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/create_subscription/create_subscription_api.dart';
import 'package:yalla_mazad/api/my_subscription/my_subscription_api.dart';
import 'package:yalla_mazad/model/create_subscription/create_subscription_model.dart';
import 'package:yalla_mazad/model/my_subscription/my_subscription_model.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../api/plans/plans_api.dart';
import '../../model/plans/plans_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';

class MySubscriptionController extends GetxController {
  static MySubscriptionController get find => Get.find();
  CarouselController carouselController = CarouselController();
  int pageIndex = 0;

  PlansModel? plansModel;
  late Future<PlansModel?> initializePlansFuture;

  @override
  void onInit() {
    initializePlansFuture = fetchAllPlans();
    initializeMySubscriptionFuture =
        fetchMySubscription(MySharedPreferences.userId);
    super.onInit();
  }

  Future<PlansModel?> fetchAllPlans() async {
    plansModel = await PlansApi().data();
    return plansModel;
  }

  MySubscriptionModel? mySubscriptionModel;
  late Future<MySubscriptionModel?> initializeMySubscriptionFuture;

  Future<MySubscriptionModel?> fetchMySubscription(int userId) async {
    mySubscriptionModel = await MySubscriptionApi().data(userId: userId);
    return mySubscriptionModel;
  }

  CreateSubscriptionModel? createSubscriptionModel;

  Future fetchCreateSubscriptionData({
    required String planId,
    required int time,
    required BuildContext context,
  }) async {
    Loader.show(
      context,
      progressIndicator: const CircularProgressIndicator(
        color: MyColors.primary,
      ),
    );
    createSubscriptionModel = await CreateSubscriptionApi().data(
        userId: MySharedPreferences.userId.toString(),
        planId: planId,
        startDate: DateTime.now().toString(),
        endDate: DateTime.now().add(Duration(days: time)).toString());
    if (createSubscriptionModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (createSubscriptionModel!.code == 200) {
      Fluttertoast.showToast(msg: createSubscriptionModel!.msg!);
    } else if (createSubscriptionModel!.code == 500) {
      Fluttertoast.showToast(
          msg: createSubscriptionModel?.msg ?? AppConstants.failedMessage);
    } else {
      Fluttertoast.showToast(
          msg: createSubscriptionModel?.msg ?? AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
