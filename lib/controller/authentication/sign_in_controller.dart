import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get find => Get.find();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
