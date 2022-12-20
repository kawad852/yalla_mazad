import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/categories/categories_api.dart';
import 'package:yalla_mazad/model/categories/categories_model.dart';
import 'package:image_picker/image_picker.dart';

class AddAuctionController extends GetxController {
  static AddAuctionController get find => Get.find();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mainPictureController = TextEditingController();
  final TextEditingController morePicturesController = TextEditingController();
  final TextEditingController auctionStartingPriceController =
      TextEditingController();
  final TextEditingController directSellPriceController =
      TextEditingController();
  CategoriesModel? categoriesModel;
  late Future<CategoriesModel?> initializeCategoriesFuture;

  String? image;
  List<String?>? images;
  pickImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      image = pickedFile.path;
      log(image!);
    }
  }

  pickMultipleImages() async {
    List<XFile?>? pickedFile = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    for (var item in pickedFile) {
      if (item != null) {
        images?.add(item.path);
      }
    }
  }

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
