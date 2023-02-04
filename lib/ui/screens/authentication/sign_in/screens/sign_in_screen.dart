import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/authentication/reset_password/reset_password_phone_number_binding.dart';
import 'package:yalla_mazad/controller/authentication/sign_in_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../reset_password/reset_password_phone_number_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final controller = SignInController.find;
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool? _checking = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.phoneSize(
          30,
          height: false,
        ),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: controller.phoneController,
                  color: MyColors.textFieldColor,
                  validator: (text) {
                    if (text == '' || text!.isEmpty) {
                      return 'cannot be empty'.tr;
                    } else if (text.length < 9) {
                      return 'not a valid phone number'.tr;
                    }
                    return null;
                  },
                  inputFormatters: [
                    ///TODO: bring back
                    // LengthLimitingTextInputFormatter(
                    //   9,
                    // ),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  prefixIcon: SizedBox(
                    width: 105,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          MyImages.phoneField,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 38,
                          color: MyColors.primary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '+962',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  hint: 'phone number'.tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: controller.passwordController,
                  color: MyColors.textFieldColor,
                  obscureText: true,

                  ///TODO: bring back
                  // validator: (text) {
                  //   if (text == '' || text!.isEmpty) {
                  //     return 'cannot be empty'.tr;
                  //   } else if (text.length < 8) {
                  //     return 'password too short'.tr;
                  //   } else if (!text.contains(RegExp(r'[0-9]'))) {
                  //     return 'password too weak'.tr;
                  //   }
                  //   return null;
                  // },
                  prefixIcon: SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          MyImages.lockField,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 38,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                  hint: 'password'.tr,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const ResetPasswordPhoneNumberScreen(),
                          binding: ResetPasswordPhoneNumberBinding(),
                        );
                      },
                      child: Text(
                        'did you forget your password?'.tr,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                          color: MyColors.primary,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.7,
                        color: MyColors.primary,
                      ),
                    ),
                    Text(
                      'or'.tr,
                      style: const TextStyle(
                        color: MyColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 10,
                        color: MyColors.primary,
                        thickness: 0.7,
                        height: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'sign in using'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(
                      0xff333333,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        MyImages.appleSignIn,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await controller.signInWithGoogle(
                          context,
                        );
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          MyImages.googleSignIn,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        _login();
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          MyImages.facebookSignIn,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () async {
                    await controller.fetchSignInData(
                        phone: controller.phoneController.text,
                        password: controller.passwordController.text,
                        context: context);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: MyColors.primary,
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'login'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _ifUserIsLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ["email", "public_profile"]);

    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final userObj =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print("Facebook Data with Credentials -> ${userObj.user.toString()}");

      final email = userObj.user?.providerData[0].email;

      final displayName = userObj.user?.providerData[0].displayName;

      _accessToken = loginResult.accessToken;
      final userInfo = await FacebookAuth.instance.getUserData();
      _userData = userInfo;
      controller.fetchSocialLogInData(
          email: email ?? '', username: displayName ?? "", context: context);
    } else {
      print('ResultStatus: ${loginResult.status}');
      print('Message: ${loginResult.message}');
    }
  }

// _logOut() async {
//   await FacebookAuth.instance.logOut();
//   _accessToken = null;
//   _userData = null;
// }
}
