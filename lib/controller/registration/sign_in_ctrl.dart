import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInCtrl extends GetxController {
  static SignInCtrl get find => Get.find();

  final isExpanded = false.obs;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggle(bool status) {
    isExpanded.value = status;
    update();
  }

  Future getData() async {
    //...
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
