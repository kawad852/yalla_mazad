import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/sign_up_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final controller = SignUpController.find;
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
                  controller: controller.nameController,
                  color: MyColors.textFieldColor,
                  validator: (text) {
                    if (text == '' || text!.isEmpty) {
                      return 'cannot be empty'.tr;
                    }
                    return null;
                  },
                  prefixIcon: SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          MyImages.userField,
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
                  hint: 'name'.tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: controller.emailController,
                  color: MyColors.textFieldColor,
                  validator: (text) {
                    if (text == '' || text!.isEmpty) {
                      return 'cannot be empty'.tr;
                    } else if (!text.contains(RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                      return 'not a valid email'.tr;
                    }
                    return null;
                  },
                  prefixIcon: SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        const Icon(
                          Icons.alternate_email,
                          color: Color(0xffBDB5D0),
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
                  hint: 'email'.tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: controller.passwordController,
                  color: MyColors.textFieldColor,
                  obscureText: true,
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
                  prefixIcon: SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        const Icon(
                          Icons.lock_open_outlined,
                          color: Color(0xffBDB5D0),
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
                  height: 10,
                ),
                CustomTextField(
                  controller: controller.confirmPasswordController,
                  color: MyColors.textFieldColor,
                  obscureText: true,
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
                  prefixIcon: SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        const Icon(
                          Icons.lock_open_outlined,
                          color: Color(0xffBDB5D0),
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
                  height: 12,
                ),
                Row(
                  children: [
                    GetBuilder<SignUpController>(builder: (v) {
                      return Checkbox(
                        activeColor: MyColors.primary,
                        value: v.isChecked,
                        onChanged: (value) {
                          v.isChecked = !v.isChecked;
                          v.update();
                        },
                      );
                    }),
                    Expanded(
                      child: Text(
                        'I agree to the terms and conditions, privacy policy'
                            .tr,
                        style: const TextStyle(
                          fontSize: 14,
                          color: MyColors.primary,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 65,
                ),
                GestureDetector(
                  onTap: () async {
                    await controller.fetchSignUpData(
                        name: controller.nameController.text,
                        email: controller.emailController.text,
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
                        'next'.tr,
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
}
