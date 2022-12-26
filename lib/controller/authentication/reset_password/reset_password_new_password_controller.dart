import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordNewPasswordController extends GetxController {
  static ResetPasswordNewPasswordController get find => Get.find();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool visible = false;
}
