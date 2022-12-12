import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController{
  static VerificationCodeController get find => Get.find();
  final TextEditingController phoneController = TextEditingController();
}