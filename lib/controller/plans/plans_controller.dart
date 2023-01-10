import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/create_subscription/create_subscription_api.dart';
import '../../api/plans/plans_api.dart';
import '../../model/create_subscription/create_subscription_model.dart';
import '../../model/plans/plans_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class PlansController extends GetxController {
  static PlansController get find => Get.find();
  int pageIndex = 0;
  PlansModel? plansModel;
  late Future<PlansModel?> initializePlansFuture;

  @override
  void onInit() {
    initializePlansFuture = fetchAllPlans();
    super.onInit();
  }

  Future<PlansModel?> fetchAllPlans() async {
    plansModel = await PlansApi().data();
    return plansModel;
  }

  CreateSubscriptionModel? createSubscriptionModel;
  Future fetchCreateSubscriptionData({
    required String planId,
    required int time,
    required BuildContext context,
  }) async {
    Loader.show(context);
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
      Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
    } else {
      Fluttertoast.showToast(msg: createSubscriptionModel!.msg!);
    }
    Loader.hide();
  }
}
