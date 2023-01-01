import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/my_badges/my_badges_api.dart';
import 'package:yalla_mazad/model/my_badges/my_badges_model.dart';

class MyAccountController extends GetxController {
  static MyAccountController get find => Get.find();
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  MyBadgesModel? myBadgesModel;
  late Future<MyBadgesModel?> initializeMyBadgesFuture;

  @override
  void onInit() {
    initializeMyBadgesFuture = fetchMyBadges();
    super.onInit();
  }

  Future<MyBadgesModel?> fetchMyBadges() async {
    myBadgesModel = await MyBadgesApi().data();
    return myBadgesModel;
  }
}
