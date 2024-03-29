import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get find => Get.find();

  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final isExpanded = false.obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
