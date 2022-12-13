import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get find => Get.find();
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex =0;
}
