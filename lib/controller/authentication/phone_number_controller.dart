import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberController extends GetxController {
  static PhoneNumberController get find => Get.find();
  final TextEditingController phoneController = TextEditingController();
}
