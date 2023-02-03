import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/auth/social_log_in_api.dart';
import 'package:yalla_mazad/binding/home/home_binding.dart';
import 'package:yalla_mazad/model/auth/social_log_in_model.dart';
import 'package:yalla_mazad/ui/widgets/custom_navigation_bar.dart';
import '../../api/auth/sign_in_api.dart';
import '../../model/auth/sign_in_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
          MySharedPreferences.phone =
              signInModel!.data!.user!.phone!.substring(4);
          MySharedPreferences.isLogIn = true;
          Get.offAll(
            () => const CustomNavigationBar(),
            binding: HomeBinding(),
          );
        } else if (signInModel!.code == 500) {
          Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
        } else {
          Fluttertoast.showToast(msg: signInModel!.msg!);
        }
        Loader.hide();
      }
    }
  }

  SocialLogInModel? socialLogInModel;
  Future fetchSocialLogInData({
    required String email,
    required String username,
    required BuildContext context,
  }) async {
    Loader.show(context);
    socialLogInModel = await SocialLoginApi().data(
      username: username,
      email: email,
    );
    if (socialLogInModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (socialLogInModel!.code == 200) {
      MySharedPreferences.accessToken = socialLogInModel!.data!.token!;
      MySharedPreferences.email = socialLogInModel!.data!.user!.email!;
      MySharedPreferences.name = socialLogInModel!.data!.user!.name!;
      MySharedPreferences.userId = socialLogInModel!.data!.user!.id!;
      //MySharedPreferences.image = socialLogInModel!.data!.user!.image!;
      MySharedPreferences.isLogIn = true;
      Get.offAll(
        () => const CustomNavigationBar(),
        binding: HomeBinding(),
      );
    } else if (socialLogInModel!.code == 500) {
      Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
    } else {
      Fluttertoast.showToast(msg: socialLogInModel!.msg!);
    }
    Loader.hide();
  }

  Future signInWithGoogle(
    BuildContext context,
  ) async {
    try {
      Loader.show(context);
      if (GoogleSignIn().currentUser == null) {
        await GoogleSignIn().signOut();
      }

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken == null) {
        Loader.hide();
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        fetchSocialLogInData(
          email: value.user!.email!,
          username: value.user!.displayName!,
          context: context,
        );
      }).catchError((onError) {
        if (onError.toString() == AppConstants.differentCredentialMessage) {
          log("FirebaseAuthException:: $onError");
          fetchSocialLogInData(
            email: onError.email!,
            username: onError.displayName!,
            context: context,
          );
        } else {
          log("FirebaseAuthException:: $onError");
          Loader.hide();
          Fluttertoast.showToast(msg: "$onError");
        }
      });
    } catch (e) {
      log("FirebaseAuthException:: $e");
      Loader.hide();
      Fluttertoast.showToast(msg: "$e");
    }
  }
}
