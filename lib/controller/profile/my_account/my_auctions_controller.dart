import 'package:get/get.dart';
import 'package:yalla_mazad/api/my_advertisements/my_advertisements_api.dart';
import 'package:yalla_mazad/model/my_advertisements/my_advertisements_model.dart';

class MyAuctionsController extends GetxController {
  static MyAuctionsController get find => Get.find();

  MyAdvertisementsModel? myAdvertisementsModel;
  late Future<MyAdvertisementsModel?> initializeMyAdsFuture;

  @override
  void onInit() {
    initializeMyAdsFuture = fetchMyAds();
    super.onInit();
  }

  Future<MyAdvertisementsModel?> fetchMyAds() async {
    myAdvertisementsModel = await MyAdvertisementsApi().data();
    update();
    return myAdvertisementsModel;
  }
}
