import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/auth/reset_password/reset_password_phone_number_api.dart';

import '../../../binding/authentication/reset_password/reset_password_code_binding.dart';
import '../../../model/auth/reset_password/reset_password_phone_number_model.dart';
import '../../../ui/screens/authentication/reset_password/reset_password_code_screen.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/shared_prefrences.dart';

class ResetPasswordPhoneNumberController extends GetxController {
  static ResetPasswordPhoneNumberController get find => Get.find();
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ResetPasswordPhoneNumberModel? resetPasswordPhoneNumberModel;

  Future fetchUpdateUserPhoneData({
    required String phone,
    required BuildContext context,
  }) async {
    ///TODO: bring back
    // if (formKey.currentState != null) {
    //   if (formKey.currentState!.validate()) {
    //     Loader.show(context);
    //     resetPasswordPhoneNumberModel =
    //         await ResetPasswordPhoneNumberApi().data(phone: phone);
    //     if (resetPasswordPhoneNumberModel == null) {
    //       Fluttertoast.showToast(msg: AppConstants.failedMessage);
    //       Loader.hide();
    //       return;
    //     }
    //     if (resetPasswordPhoneNumberModel!.code == 200) {
    //       MySharedPreferences.phone = phone;
          Get.to(
            () => const ResetPasswordCodeScreen(),
            binding: ResetPasswordCodeBinding(),
          );
    //     } else if (resetPasswordPhoneNumberModel!.code == 500) {
    //       Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
    //     } else {
    //       Fluttertoast.showToast(msg: resetPasswordPhoneNumberModel!.msg!);
    //     }
    //     Loader.hide();
    //   }
    // }
  }
}
