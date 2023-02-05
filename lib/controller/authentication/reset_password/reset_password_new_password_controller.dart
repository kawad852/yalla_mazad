import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/auth/reset_password/reset_password_new_password_api.dart';
import 'package:yalla_mazad/model/auth/reset_password/reset_password_new_password_model.dart';
import 'package:yalla_mazad/ui/screens/authentication/reset_password/reset_password_congrats.dart';

import '../../../utils/app_constants.dart';

class ResetPasswordNewPasswordController extends GetxController {
  static ResetPasswordNewPasswordController get find => Get.find();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool visible = false;

  ResetPasswordNewPasswordModel? resetPasswordNewPasswordModel;

  Future fetchUpdateUserPasswordData({
    required String phone,
    required BuildContext context,
  }) async {
    if (passwordController.text == confirmPasswordController.text) {
      if (formKey.currentState != null) {
        if (formKey.currentState!.validate()) {
          Loader.show(context);
          resetPasswordNewPasswordModel = await ResetPasswordNewPasswordApi()
              .data(phone: phone, password: passwordController.text);
          if (resetPasswordNewPasswordModel == null) {
            Fluttertoast.showToast(msg: AppConstants.failedMessage);
            Loader.hide();
            return;
          }
          if (resetPasswordNewPasswordModel!.code == 200) {
            Get.off(
              () => const ResetPasswordCongratsScreen(),
            );
          } else if (resetPasswordNewPasswordModel!.code == 500) {
            Fluttertoast.showToast(
                msg: resetPasswordNewPasswordModel?.msg ??
                    AppConstants.failedMessage);
          } else {
            Fluttertoast.showToast(
                msg: resetPasswordNewPasswordModel?.msg ??
                    AppConstants.failedMessage);
          }
          Loader.hide();
        }
      }
    } else {
      Fluttertoast.showToast(msg: 'passwords do not match'.tr);
    }
  }
}
