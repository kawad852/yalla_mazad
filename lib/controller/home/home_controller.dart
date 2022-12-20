import 'package:get/get.dart';
import 'package:yalla_mazad/api/categories/categories_api.dart';
import 'package:yalla_mazad/model/categories/categories_model.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();
  CategoriesModel? categoriesModel;
  late Future<CategoriesModel?> initializeCategoriesFuture;


  @override
  void onInit() {
    initializeCategoriesFuture = fetchAllCategories();
    super.onInit();
  }

  Future<CategoriesModel?> fetchAllCategories() async {
    categoriesModel = await CategoriesApi().data();
    return categoriesModel;
  }
}
