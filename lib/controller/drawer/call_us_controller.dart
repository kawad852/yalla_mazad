import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CallUsController extends GetxController {
  static CallUsController get find => Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
}
