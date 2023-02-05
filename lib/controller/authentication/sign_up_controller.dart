import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/auth/register_api.dart';
import 'package:yalla_mazad/model/auth/register_model.dart';

import '../../binding/authentication/phone_number_binding.dart';
import '../../ui/screens/authentication/phone_number/screens/phone_number_screen.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';

class SignUpController extends GetxController {
  static SignUpController get find => Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;
  RegisterModel? registerModel;

  Future fetchSignUpData({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (isChecked) {
      if (passwordController.text == confirmPasswordController.text) {
        if (formKey.currentState != null) {
          if (formKey.currentState!.validate()) {
            Loader.show(context);
            // OverLayLoader.showLoading(context);
            registerModel = await RegisterApi()
                .data(name: name, email: email, password: password);
            if (registerModel == null) {
              Fluttertoast.showToast(msg: AppConstants.failedMessage);
              Loader.hide();
              return;
            }

            if (registerModel!.code == 200) {
              MySharedPreferences.accessToken = registerModel!.data!.token!;
              MySharedPreferences.email = registerModel!.data!.user!.email!;
              MySharedPreferences.name = registerModel!.data!.user!.name!;
              MySharedPreferences.userId = registerModel!.data!.user!.id!;
              MySharedPreferences.image = registerModel!.data!.user!.image!;
              Get.to(
                () => const PhoneNumberScreen(),
                binding: PhoneNumberBinding(),
              );
            } else if (registerModel!.code == 500) {
              Fluttertoast.showToast(
                  msg: registerModel?.msg ?? AppConstants.failedMessage);
            } else {
              Fluttertoast.showToast(
                  msg: registerModel?.msg ?? AppConstants.failedMessage);
            }
            Loader.hide();
          }
        }
      } else {
        Fluttertoast.showToast(msg: 'passwords do not match'.tr);
      }
    } else {
      Fluttertoast.showToast(msg: 'you did not agree'.tr);
    }
  }
}
