import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

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
    super.onInit();
  }

  Future<PlansModel?> fetchAllPlans() async {
    plansModel = await PlansApi().data();
    return plansModel;
  }
}
