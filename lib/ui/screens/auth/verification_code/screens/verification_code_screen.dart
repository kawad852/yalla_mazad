import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/verification_code_controller.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.phoneSize(
            30,
            height: false,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    MyImages.logoColored,
                    width: 150,
                    height: 75,
                  ),
                  const SizedBox(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.phoneSize(
                        30,
                        height: false,
                      ),
                    ),
                    child: Container(
                      height: 67,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
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
                        'enter the verification code sent to your phone number'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: MyColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _getPhoneTextField(),
                    const SizedBox(
                      height: 10,
                    ),
                    // _getPhoneTextField(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    GestureDetector(
                      onTap: () {},
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
    );
  }

  _getPhoneTextField() {
    return CustomTextField(
      controller: controller.phoneController,
      color: MyColors.textFieldColor,
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
    );
  }
}
