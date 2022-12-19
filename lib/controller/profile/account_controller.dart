import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/shared_prefrences.dart';

class AccountController extends GetxController {
  static AccountController get find => Get.find();
  final TextEditingController nameController =
      TextEditingController(text: MySharedPreferences.name);
  final TextEditingController emailController =
      TextEditingController(text: MySharedPreferences.email);
  final TextEditingController phoneController =
      TextEditingController(text: MySharedPreferences.phone);
}
