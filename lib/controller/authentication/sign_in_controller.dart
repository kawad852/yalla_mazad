import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/home/home_binding.dart';
import 'package:yalla_mazad/ui/widgets/custom_navigation_bar.dart';
import '../../api/auth/sign_in_api.dart';
import '../../model/auth/sign_in_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';

class SignInController extends GetxController {
  static SignInController get find => Get.find();
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  SignInModel? signInModel;

  Future fetchSignInData({
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        Loader.show(context);
        // OverLayLoader.showLoading(context);
        signInModel = await SignInApi().data(phone: phone, password: password);
        if (signInModel == null) {
          Fluttertoast.showToast(msg: AppConstants.failedMessage);
          Loader.hide();
          return;
        }
        if (signInModel!.code == 200) {
          MySharedPreferences.accessToken = signInModel!.data!.token!;
          MySharedPreferences.email = signInModel!.data!.user!.email!;
          MySharedPreferences.name = signInModel!.data!.user!.name!;
          MySharedPreferences.userId = signInModel!.data!.user!.id!;
          MySharedPreferences.image = signInModel!.data!.user!.image!;
          MySharedPreferences.phone = signInModel!.data!.user!.phone!;
          MySharedPreferences.isLogIn = true;
          Get.offAll(() => const CustomNavigationBar(), binding: HomeBinding());
          // Get.offAll(() => const BaseNavBar(), binding: NavBarBinding());
        } else if (signInModel!.code == 500) {
          Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
        } else {
          Fluttertoast.showToast(msg: signInModel!.msg!);
        }
        Loader.hide();
      }
    }
  }
}
