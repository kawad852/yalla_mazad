import 'package:get/get.dart';
import 'package:yalla_mazad/model/my_notifications/my_notifications_model.dart';

import '../../api/my_notifications/my_notifications_api.dart';


class NotificationsController extends GetxController {
  static NotificationsController get find => Get.find();

  MyNotificationsModel? plansModel;
  late Future<MyNotificationsModel?> initializeMyNotificationsFuture;

  @override
  void onInit() {
    initializeMyNotificationsFuture = fetchMyNotifications();
    super.onInit();
  }

  Future<MyNotificationsModel?> fetchMyNotifications() async {
    plansModel = await MyNotificationsApi().data();
    return plansModel;
  }
}
