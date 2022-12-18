import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/model/auth/update_user_phone_model.dart';
import 'package:yalla_mazad/utils/app_constants.dart';

import '../../api/auth/update_user_phone_api.dart';
import '../../binding/authentication/verification_code_binding.dart';
import '../../ui/screens/auth/verification_code/screens/verification_code_screen.dart';
import '../../utils/shared_prefrences.dart';

class PhoneNumberController extends GetxController {
  static PhoneNumberController get find => Get.find();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryCodeController =
      TextEditingController(text: AppConstants.jordan);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UpdateUserPhoneModel? updateUserPhoneModel;

  Future fetchUpdateUserPhoneData({
    required String phone,
    required int id,
    required BuildContext context,
  }) async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        Loader.show(context);
        // OverLayLoader.showLoading(context);
        updateUserPhoneModel =
            await UpdateUserPhoneApi().data(phone: phone, id: id);
        if (updateUserPhoneModel == null) {
          Fluttertoast.showToast(msg: AppConstants.failedMessage);
          Loader.hide();
          return;
        }
        if (updateUserPhoneModel!.code == 200) {
          MySharedPreferences.phone = phone;
          MySharedPreferences.isLogIn = true;
          Get.to(
            () => const VerificationCodeScreen(),
            binding: VerificationCodeBinding(),
          );
          // Get.offAll(() => const BaseNavBar(), binding: NavBarBinding());
        } else if (updateUserPhoneModel!.code == 500) {
          Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
        } else {
          Fluttertoast.showToast(msg: updateUserPhoneModel!.msg!);
        }
        Loader.hide();
      }
    }
  }
}
