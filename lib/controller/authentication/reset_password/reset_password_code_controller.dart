import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../binding/authentication/reset_password/reset_password_new_password_binding.dart';
import '../../../model/auth/opt_check_model.dart';
import '../../../ui/screens/authentication/reset_password/reset_password_new_password_screen.dart';
import '../../../utils/shared_prefrences.dart';

class ResetPasswordCodeController extends GetxController {
  static ResetPasswordCodeController get find => Get.find();
  final TextEditingController phoneController =
      TextEditingController(text: '+962${MySharedPreferences.phone}');
  final List<TextEditingController> codeControllers = List.generate(
    4,
    (index) => TextEditingController(),
    growable: false,
  );
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  OptCheckModel? optCheckModel;
  late String code;

  Future fetchOTPCheckData({
    required String phone,
    required BuildContext context,
  }) async {
    ///TODO bring back and make sure
    // if (formKey.currentState != null) {
    //   if (formKey.currentState!.validate()) {
    //     code =
    //         '${codeControllers[0].text}${codeControllers[1].text}${codeControllers[2].text}${codeControllers[3].text}';
    // Loader.show(
    //   context,
    //   progressIndicator: const CircularProgressIndicator(
    //     color: MyColors.primary,
    //   ),
    // );
    //     optCheckModel = await OptCheckApi().data(phone: phone, code: code);
    //     if (optCheckModel == null) {
    //       Fluttertoast.showToast(msg: AppConstants.failedMessage);
    //       Loader.hide();
    //       return;
    //     }
    //     if (optCheckModel!.code == 200) {
    //       MySharedPreferences.phone = phone;
    //       MySharedPreferences.isLogIn = true;
    Get.off(() => const ResetPasswordNewPasswordScreen(),
        binding: ResetPasswordNewPasswordBinding());
    //     } else if (optCheckModel!.code == 500) {
    //       Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
    //     } else {
    //       Fluttertoast.showToast(msg: optCheckModel!.msg!);
    //     }
    //     Loader.hide();
    //   }
    // }
  }
}
