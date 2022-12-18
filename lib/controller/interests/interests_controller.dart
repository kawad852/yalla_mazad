import 'package:get/get.dart';
import 'package:yalla_mazad/api/interests/interests_api.dart';
import 'package:yalla_mazad/model/interests/interests_model.dart';


class InterestsController extends GetxController {
  static InterestsController get find => Get.find();
  List<int> selectedInterests =[];

  @override
  void onInit() {
    initializeInterestsFuture = fetchAllInterests();
    super.onInit();
  }

  InterestsModel? interestsModel;
  late Future<InterestsModel?> initializeInterestsFuture;

  Future<InterestsModel?> fetchAllInterests() async {
    interestsModel = await InterestsApi().data();
    return interestsModel;
  }
}
