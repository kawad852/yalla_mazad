import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/change_password/change_password_api.dart';
import 'package:yalla_mazad/model/change_password/change_password_model.dart';

import '../../utils/app_constants.dart';

class EditPasswordController extends GetxController {
  static EditPasswordController get find => Get.find();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool oldIsVisible = false;
  bool newIsVisible = false;

  ChangePasswordModel? changePasswordModel;

  Future fetchChangePasswordData({
    required String oldPassword,
    required String newPassword,
    required BuildContext context,
  }) async {
    if (passwordController.text == confirmPasswordController.text) {
      if (formKey.currentState != null) {
        //if (formKey.currentState!.validate()) {
        Loader.show(context);
        changePasswordModel = await ChangePasswordApi()
            .data(oldPassword: oldPassword, newPassword: newPassword);
        if (changePasswordModel == null) {
          Fluttertoast.showToast(msg: AppConstants.failedMessage);
          Loader.hide();
          return;
        }
        if (changePasswordModel!.code == 200) {
          Fluttertoast.showToast(msg: changePasswordModel!.msg!);
        } else if (changePasswordModel!.code == 500) {
          Fluttertoast.showToast(msg: 'password not matched'.tr);
        } else {
          Fluttertoast.showToast(msg: changePasswordModel!.msg!);
        }
        Loader.hide();
      }
      // }
    } else {
      Fluttertoast.showToast(msg: 'passwords do not match'.tr);
    }
  }
}
