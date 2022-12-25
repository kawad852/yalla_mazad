import 'package:get/get.dart';
import 'package:yalla_mazad/api/my_favorites/my_favorites_api.dart';
import 'package:yalla_mazad/model/my_favorites/my_favorites_model.dart';

class MyFavoritesController extends GetxController {
  static MyFavoritesController get find => Get.find();

  MyFavoritesModel? myFavoritesModel;
  late Future<MyFavoritesModel?> initializeMyFavFuture;

  @override
  void onInit() {
    initializeMyFavFuture = fetchMyFav();
    super.onInit();
  }

  Future<MyFavoritesModel?> fetchMyFav() async {
    myFavoritesModel = await MyFavoritesApi().data();
    return myFavoritesModel;
  }
}
