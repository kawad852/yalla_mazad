import 'package:get/get.dart';
import 'package:yalla_mazad/api/introduction/introduction_api.dart';
import 'package:yalla_mazad/model/introduction/introduction_model.dart';

class IntroductionController extends GetxController {
  static IntroductionController get find => Get.find();
  IntroductionModel? introductionModel;
  late Future<IntroductionModel?> initializeIntroductionFuture;

  @override
  void onInit() {
    initializeIntroductionFuture = fetchAllIntroduction();
    super.onInit();
  }

  Future<IntroductionModel?> fetchAllIntroduction() async {
    introductionModel = await IntroductionApi().data();
    return introductionModel;
  }
}
