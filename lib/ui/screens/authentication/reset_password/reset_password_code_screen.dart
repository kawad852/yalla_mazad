import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/reset_password/reset_password_code_controller.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../widgets/custom_text_field.dart';

class ResetPasswordCodeScreen extends StatefulWidget {
  const ResetPasswordCodeScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordCodeScreen> createState() =>
      _ResetPasswordCodeScreenState();
}

class _ResetPasswordCodeScreenState extends State<ResetPasswordCodeScreen> {
  final controller = ResetPasswordCodeController.find;

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
                    'confirm your phone number'.tr,
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
                          MyImages.phone,
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
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'please enter the 4-digit verification code sent to'
                                            .tr,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: MyColors.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller.phoneController.text
                                        .substring(1),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: MyColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 56,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Form(
                              key: controller.formKey,
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: CustomTextField(
                                        controller:
                                            controller.codeControllers[0],
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
                                        controller:
                                            controller.codeControllers[1],
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
                                        controller:
                                            controller.codeControllers[2],
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
                                        controller:
                                            controller.codeControllers[3],
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 4.5,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await controller.fetchOTPCheckData(
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
    );
  }
}
