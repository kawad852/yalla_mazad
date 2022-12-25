import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountController extends GetxController {
  static MyAccountController get find => Get.find();
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
}
