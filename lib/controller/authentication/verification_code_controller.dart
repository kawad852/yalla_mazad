import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/auth/resend_otp_api.dart';
import 'package:yalla_mazad/model/auth/opt_check_model.dart';
import 'package:yalla_mazad/model/auth/resend_otp_model.dart';

import '../../binding/interests/interests_binding.dart';
import '../../ui/screens/interests/screens/interests_screen.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';

class VerificationCodeController extends GetxController {
  static VerificationCodeController get find => Get.find();
  final TextEditingController phoneController =
      TextEditingController(text: '+962${MySharedPreferences.phone}');
  final List<TextEditingController> codeControllers = List.generate(
    4,
    (index) => TextEditingController(),
    growable: false,
  );

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ResendOtpModel? resendOtpModel;
  OptCheckModel? optCheckModel;
  late String code;
  Timer? timer;
  Duration duration = const Duration(
    seconds: 1,
  );
  int remaining = 59;

  startTimer() {
    timer = Timer.periodic(duration, (timer) {
      if (remaining == 0) {
        timer.cancel();
      } else {
        remaining--;
      }
      update();
    });
    update();
  }

  Future fetchOTPCheckData({
    required String phone,
    required BuildContext context,
  }) async {
    ///TODO:bring back and make sure
    // if (formKey.currentState != null) {
    //   if (formKey.currentState!.validate()) {
    //     Loader.show(context);
    // code =   '${codeControllers[0].text}${codeControllers[1].text}${codeControllers[2].text}${codeControllers[3].text}';
    // optCheckModel = await OptCheckApi().data(phone: phone, code: code);
    //     if (optCheckModel == null) {
    //       Fluttertoast.showToast(msg: AppConstants.failedMessage);
    //       Loader.hide();
    //       return;
    //     }
    //     if (optCheckModel!.code == 200) {
    //       MySharedPreferences.phone = phone;
    //       MySharedPreferences.isLogIn = true;
    Get.to(() => const InterestsScreen(), binding: InterestsBinding());
    //     } else if (optCheckModel!.code == 500) {
    //       Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
    //     } else {
    //       Fluttertoast.showToast(msg: optCheckModel!.msg!);
    //     }
    //     Loader.hide();
    //   }
    // }
  }

  Future resendOtpData({
    required int id,
    required BuildContext context,
  }) async {
    Loader.show(context);
    resendOtpModel = await ResendOtpApi().data(id: id);
    if (resendOtpModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (resendOtpModel!.code == 200) {
      // Get.to(() => const InterestsScreen(), binding: InterestsBinding());
    } else if (resendOtpModel!.code == 500) {
      Fluttertoast.showToast(
          msg: resendOtpModel?.msg ?? AppConstants.failedMessage);
    } else {
      Fluttertoast.showToast(
          msg: resendOtpModel?.msg ?? AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
