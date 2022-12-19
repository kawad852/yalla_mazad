import 'package:get/get.dart';
import 'package:yalla_mazad/api/subscriptions/subscriptions_api.dart';
import 'package:yalla_mazad/model/subscriptions/subscriptions_model.dart';

class SubscriptionsController extends GetxController {
  static SubscriptionsController get find => Get.find();
  int pageIndex = 0;
  // SubscriptionsModel? subscriptionsModel;
  // late Future<SubscriptionsModel?> initializeSubscriptionsFuture;
  //
  // @override
  // void onInit() {
  //   initializeSubscriptionsFuture = fetchAllSubscriptions();
  //   super.onInit();
  // }
  //
  // Future<SubscriptionsModel?> fetchAllSubscriptions() async {
  //   subscriptionsModel = await SubscriptionApi().data();
  //   return subscriptionsModel;
  // }
}
