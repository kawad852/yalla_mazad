import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/reset_password/reset_password_new_password_controller.dart';
import 'package:yalla_mazad/ui/screens/auth/reset_password/reset_password_congrats.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../widgets/custom_text_field.dart';

class ResetPasswordNewPasswordScreen extends StatefulWidget {
  const ResetPasswordNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordNewPasswordScreen> createState() =>
      _ResetPasswordNewPasswordScreenState();
}

class _ResetPasswordNewPasswordScreenState
    extends State<ResetPasswordNewPasswordScreen> {
  final controller = ResetPasswordNewPasswordController.find;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.phoneSize(
              30,
              height: false,
            ),
          ),
          child: Form(
            key: controller.formKey,
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'create a new password'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 244,
                    width: 244,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.textFieldColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          MyImages.lock,
                          width: 120,
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 2 * MediaQuery.of(context).size.height / 2.3,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Text(
                              'The new password must be different from the previously used password'
                                  .tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: MyColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 56,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Text(
                              'password'.tr,
                              style: const TextStyle(
                                color: MyColors.primary,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          GetBuilder<ResetPasswordNewPasswordController>(
                              builder: (value) {
                            return CustomTextField(
                              controller: value.passwordController,
                              color: MyColors.textFieldColor,
                              obscureText: value.visible,
                              validator: (text) {
                                if (text == '' || text!.isEmpty) {
                                  return 'cannot be empty'.tr;
                                } else if (text.length < 8) {
                                  return 'password too short'.tr;
                                } else if (!text.contains(RegExp(r'[0-9]'))) {
                                  return 'password too weak'.tr;
                                }
                                return null;
                              },
                              hint: 'password'.tr,
                              suffixIcon: IconButton(
                                icon: Icon(value.visible
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye),
                                onPressed: () {
                                  value.visible = !value.visible;
                                  value.update();
                                },
                              ),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Text(
                              'confirm password'.tr,
                              style: const TextStyle(
                                color: MyColors.primary,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          GetBuilder<ResetPasswordNewPasswordController>(
                              builder: (value) {
                            return CustomTextField(
                              controller: value.confirmPasswordController,
                              color: MyColors.textFieldColor,
                              obscureText: value.visible,
                              validator: (text) {
                                if (text == '' || text!.isEmpty) {
                                  return 'cannot be empty'.tr;
                                } else if (text.length < 8) {
                                  return 'password too short'.tr;
                                } else if (!text.contains(RegExp(r'[0-9]'))) {
                                  return 'password too weak'.tr;
                                }
                                return null;
                              },
                              hint: 'confirm password'.tr,
                              suffixIcon: IconButton(
                                icon: Icon(value.visible
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye),
                                onPressed: () {
                                  value.visible = !value.visible;
                                  value.update();
                                },
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 90,
                          ),
                          GestureDetector(
                            onTap: () async {
                              ///TODO: change to api
                              Get.off(() => const ResetPasswordCongratsScreen());
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
                                  'save'.tr,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
