import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/auth/opt_check_api.dart';
import 'package:yalla_mazad/controller/authentication/phone_number_controller.dart';
import 'package:yalla_mazad/model/auth/opt_check_model.dart';

import '../../api/auth/update_user_phone_api.dart';
import '../../binding/authentication/interests_binding.dart';
import '../../model/auth/update_user_phone_model.dart';
import '../../ui/screens/auth/interests/screens/interests_screen.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';

class VerificationCodeController extends GetxController {
  static VerificationCodeController get find => Get.find();
  final TextEditingController phoneController = TextEditingController(
      text: PhoneNumberController.find.phoneController.text);
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
  UpdateUserPhoneModel? updateUserPhoneModel;
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
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        Loader.show(context);
        // OverLayLoader.showLoading(context);
        optCheckModel = await OptCheckApi().data(phone: phone, code: code);
        if (optCheckModel == null) {
          Fluttertoast.showToast(msg: AppConstants.failedMessage);
          Loader.hide();
          return;
        }
        if (optCheckModel!.code == 200) {
          MySharedPreferences.phone = phone;
          MySharedPreferences.isLogIn = true;
          // Get.offAll(() => const BaseNavBar(), binding: NavBarBinding());
        } else if (optCheckModel!.code == 500) {
          Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
        } else {
          Fluttertoast.showToast(msg: optCheckModel!.msg!);
        }
        Loader.hide();
      }
    }
  }

  Future fetchUpdateUserPhoneData({
    required String phone,
    required int id,
    required BuildContext context,
  }) async {
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
      Get.to(() => const InterestsScreen(), binding: InterestsBinding());
      // Get.offAll(() => const BaseNavBar(), binding: NavBarBinding());
    } else if (updateUserPhoneModel!.code == 500) {
      Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
    } else {
      Fluttertoast.showToast(msg: updateUserPhoneModel!.msg!);
    }
    Loader.hide();
  }
}
