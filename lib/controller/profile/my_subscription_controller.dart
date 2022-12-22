import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/my_subscription/my_subscription_api.dart';
import 'package:yalla_mazad/model/my_subscription/my_subscription_model.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../api/plans/plans_api.dart';
import '../../model/plans/plans_model.dart';

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
}
