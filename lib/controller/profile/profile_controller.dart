import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get find => Get.find();
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  String? image;
  pickImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      image = pickedFile.path;
      // log(image!);
    }
  }
}
