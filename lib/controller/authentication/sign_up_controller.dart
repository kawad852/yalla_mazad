import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get find => Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
}