import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/verification_code_controller.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../../../widgets/custom_text_field.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final controller = VerificationCodeController.find;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      MyImages.logoColored,
                      width: 150,
                      height: 75,
                    ),
                  ],
                ),
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
                          'please enter the verification code'.tr,
                          style: const TextStyle(
                            fontSize: 32,
                            color: MyColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                        ),
                        child: Text(
                          'enter the verification code sent to your phone number'
                              .tr,
                          style: const TextStyle(
                            fontSize: 16,
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
                          readOnly: true,
                          suffixIcon: Transform.scale(
                            scale: 0.5,
                            child: Image.asset(
                              MyImages.pencilField,
                              width: 10,
                              height: 10,
                            ),
                          ),
                          prefixIcon: SizedBox(
                            width: 60,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 18,
                                ),
                                const Icon(
                                  Icons.local_phone_outlined,
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
                          hint: 'phone number'.tr,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Form(
                          key: controller.formKey,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: CustomTextField(
                                    controller: controller.codeControllers[0],
                                    color: MyColors.textFieldColor,
                                    textAlign: TextAlign.center,
                                    textInputAction: TextInputAction.next,
                                    hint: '1',
                                    validator: (text) {
                                      if (text!.isEmpty || text == '') {
                                        return '';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(
                                        1,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: CustomTextField(
                                    controller: controller.codeControllers[1],
                                    color: MyColors.textFieldColor,
                                    textAlign: TextAlign.center,
                                    textInputAction: TextInputAction.next,
                                    hint: '2',
                                    validator: (text) {
                                      if (text!.isEmpty || text == '') {
                                        return '';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(
                                        1,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: CustomTextField(
                                    controller: controller.codeControllers[2],
                                    color: MyColors.textFieldColor,
                                    textAlign: TextAlign.center,
                                    textInputAction: TextInputAction.next,
                                    hint: '3',
                                    validator: (text) {
                                      if (text!.isEmpty || text == '') {
                                        return '';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(
                                        1,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: CustomTextField(
                                    controller: controller.codeControllers[3],
                                    color: MyColors.textFieldColor,
                                    textAlign: TextAlign.center,
                                    textInputAction: TextInputAction.done,
                                    hint: '4',
                                    validator: (text) {
                                      if (text!.isEmpty || text == '') {
                                        return '';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(
                                        1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: GetBuilder<VerificationCodeController>(
                          init: VerificationCodeController(),
                          builder: (controller) {
                            return controller.remaining != 0
                                ? RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'didn\'t receive a code?'.tr,
                                          style: const TextStyle(
                                            color: MyColors.primary,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' ',
                                          style: TextStyle(
                                            color: MyColors.primary,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'resend after'.tr,
                                          style: const TextStyle(
                                            color: MyColors.primary,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ${controller.remaining} ',
                                          style: const TextStyle(
                                            color: MyColors.primary,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'seconds'.tr,
                                          style: const TextStyle(
                                            color: MyColors.primary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'didn\'t receive a code?'.tr,
                                        style: const TextStyle(
                                          color: MyColors.primary,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await controller.resendOtpData(
                                              id: MySharedPreferences.userId,
                                              context: context);
                                        },
                                        child: Text(
                                          'resend now'.tr,
                                          style: const TextStyle(
                                            color: MyColors.primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                      GestureDetector(
                        onTap: () async {
                          controller.code =
                              '${controller.codeControllers[0].text}${controller.codeControllers[1].text}${controller.codeControllers[2].text}${controller.codeControllers[3].text}';
                          await controller.fetchOTPCheckData(
                              phone: MySharedPreferences.phone,
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
            ],
          ),
        ),
      ),
    );
  }
}
