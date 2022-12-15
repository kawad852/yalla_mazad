import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/utils/app_constants.dart';

class PhoneNumberController extends GetxController {
  static PhoneNumberController get find => Get.find();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryCodeController =
      TextEditingController(text: AppConstants.jordan);
}
