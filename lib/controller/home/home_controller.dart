import 'package:get/get.dart';
import 'package:yalla_mazad/api/categories/categories_api.dart';
import 'package:yalla_mazad/api/slider/slider_spi.dart';
import 'package:yalla_mazad/model/categories/categories_model.dart';
import 'package:yalla_mazad/model/slider/slider_model.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();

  CategoriesModel? categoriesModel;
  late Future<CategoriesModel?> initializeCategoriesFuture;

  @override
  void onInit() {
    initializeCategoriesFuture = fetchAllCategories();
    initializeSliderFuture = fetchAllSliders();
    super.onInit();
  }

  Future<CategoriesModel?> fetchAllCategories() async {
    categoriesModel = await CategoriesApi().data();
    return categoriesModel;
  }

  SliderModel? sliderModel;
  late Future<SliderModel?> initializeSliderFuture;

  Future<SliderModel?> fetchAllSliders() async {
    sliderModel = await SliderApi().data();
    return sliderModel;
  }
}
