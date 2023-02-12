import 'package:get/get.dart';
import 'package:yalla_mazad/api/my_advertisements/my_advertisements_api.dart';
import 'package:yalla_mazad/model/my_advertisements/my_advertisements_model.dart';

class MyAuctionsController extends GetxController {
  static MyAuctionsController get find => Get.find();

  RxDouble auctionsLength = 0.0.obs;

  MyAdvertisementsModel? myAdvertisementsModel;
  late Future<MyAdvertisementsModel?> initializeMyAdsFuture;

  @override
  void onInit() {
    initializeMyAdsFuture = fetchMyAds();
    super.onInit();
  }

  Future<MyAdvertisementsModel?> fetchMyAds() async {
    myAdvertisementsModel = await MyAdvertisementsApi().data();
    auctionsLength.value =
        myAdvertisementsModel?.data?.length.toDouble() ?? 0.0;
    update();
    return myAdvertisementsModel;
  }
}
