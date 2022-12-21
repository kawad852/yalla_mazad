import 'package:get/get.dart';

import '../../api/plans/plans_api.dart';
import '../../model/plans/plans_model.dart';

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
}
