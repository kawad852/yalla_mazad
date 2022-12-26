
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/ui/screens/auth/reset_password/reset_password_code_screen.dart';

import '../../../binding/authentication/reset_password/reset_password_code_binding.dart';
import '../../../utils/shared_prefrences.dart';
class ResetPasswordPhoneNumberController extends GetxController {
  static ResetPasswordPhoneNumberController get find => Get.find();
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 // UpdateUserPhoneModel? updateUserPhoneModel;

  Future fetchUpdateUserPhoneData({
    required String phone,
    required BuildContext context,
  }) async {
    // if (formKey.currentState != null) {
    //   if (formKey.currentState!.validate()) {
    //     Loader.show(context);
    //     // OverLayLoader.showLoading(context);
    //     updateUserPhoneModel =
    //     await UpdateUserPhoneApi().data(phone: phone, id: id);
    //     if (updateUserPhoneModel == null) {
    //       Fluttertoast.showToast(msg: AppConstants.failedMessage);
    //       Loader.hide();
    //       return;
    //     }
    //     if (updateUserPhoneModel!.code == 200) {
          MySharedPreferences.phone = phone;
          // Get.to(
          //       () => const ResetPasswordCodeScreen(),
          //   binding: ResetPasswordCodeBinding(),
          // );
    //       // Get.offAll(() => const BaseNavBar(), binding: NavBarBinding());
    //     } else if (updateUserPhoneModel!.code == 500) {
    //       Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
    //     } else {
    //       Fluttertoast.showToast(msg: updateUserPhoneModel!.msg!);
    //     }
    //     Loader.hide();
    //   }
    // }

    ///TODO: edit when api is ready
          Get.off(
                () => const ResetPasswordCodeScreen(),
            binding: ResetPasswordCodeBinding(),
          );

  }
}
