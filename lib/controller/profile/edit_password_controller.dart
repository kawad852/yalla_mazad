import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditPasswordController extends GetxController {
  static EditPasswordController get find => Get.find();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
}
