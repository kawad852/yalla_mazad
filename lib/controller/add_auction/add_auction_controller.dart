import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/add_auction/add_auction_api.dart';
import 'package:yalla_mazad/api/categories/categories_api.dart';
import 'package:yalla_mazad/model/categories/categories_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../model/add_auction/add_auction_model.dart';
import '../../ui/screens/add_auction/widgets/added_auction_dialog.dart';
import '../../utils/app_constants.dart';

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
  MapEntry<String, String> selectedCategory = const MapEntry('-1', '0');
  final formKey = GlobalKey<FormState>();

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
      // log(image!);
      if (Get.locale == const Locale('en')) {
        mainPictureController.text = '1 picture selected';
      } else {
        mainPictureController.text = ' صور واحدة مختارة ';
      }
    }
  }

  pickMultipleImages() async {
    List<XFile?>? pickedFile = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );

    int i = 0;
    for (var item in pickedFile) {
      if (item != null) {
        i++;
        // log(pickedFile.length.toString());
        images?.add(item.path);
        // log(item.path);
      }
    }
    if (Get.locale == const Locale('en')) {
      morePicturesController.text = '$i pictures selected';
    } else {
      morePicturesController.text = '$i صور مختارة ';
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

  List<File?>? getListOfFiles() {
    List<File?> files = [];
    if (image != null) {
      // log('image !=null');
      files.add(File(image!));
    } else {
      // log('image ==null');
    }
    if (images != null) {
      // log('images !=null');
      for (var item in images!) {
        if (item != null) {
          var file = File(item);
          files.add(file);
          // log(file.path);
        }
      }
    } else {
      // log('images ==null');
    }
    return files;
  }

  AddAuctionModel? addAuctionModel;
  Future fetchAddAuctionData({
    required BuildContext context,
  }) async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
    Loader.show(context);
    addAuctionModel = await AddAuctionApi().data(
      file: getListOfFiles(),
      name: addressController.text,
      content: descriptionController.text,
      startPrice: auctionStartingPriceController.text,
      userId: MySharedPreferences.userId,
      categoryId: selectedCategory.value,
      buyNowPrice: directSellPriceController.text,
    );
    if (addAuctionModel == null) {
      Fluttertoast.showToast(
        msg: AppConstants.failedMessage,
      );
      Loader.hide();
      return;
    }
    if (addAuctionModel!.code == 200) {
      Get.dialog(
        AddedAuctionDialog(),
      );
      addressController.clear();
      descriptionController.clear();
      auctionStartingPriceController.clear();
      directSellPriceController.clear();
      image = null;
      images = [];
    } else if (addAuctionModel!.code == 500) {
      Fluttertoast.showToast(
        msg: AppConstants.failedMessage,
      );
    } else {
      Fluttertoast.showToast(
        msg: addAuctionModel!.msg!,
      );
    }
    Loader.hide();
      }
    }
  }
}
