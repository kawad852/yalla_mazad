import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/reset_password/reset_password_phone_number_controller.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../widgets/custom_text_field.dart';

class ResetPasswordPhoneNumberScreen extends StatefulWidget {
  const ResetPasswordPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPhoneNumberScreen> createState() =>
      _ResetPasswordPhoneNumberScreenState();
}

class _ResetPasswordPhoneNumberScreenState
    extends State<ResetPasswordPhoneNumberScreen> {
  final controller = ResetPasswordPhoneNumberController.find;
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
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'did you forget your password?'.tr,
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
                      height: ScreenSize.phoneSize(
                        244,
                        height: false,
                      ),
                      width: ScreenSize.phoneSize(
                        244,
                        height: false,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.textFieldColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            MyImages.lockQuestion,
                            width: ScreenSize.phoneSize(
                              120,
                              height: false,
                            ),
                            height: ScreenSize.phoneSize(
                              120,
                              height: false,
                            ),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              child: Text(
                                'please enter your phone number to receive a verification code'
                                    .tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: MyColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: CustomTextField(
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
                                  LengthLimitingTextInputFormatter(
                                    9,
                                  ),
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
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3.3,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await controller.fetchUpdateUserPhoneData(
                                    phone: controller.phoneController.text,
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
                                    'send'.tr,
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
      ),
    );
  }
}
