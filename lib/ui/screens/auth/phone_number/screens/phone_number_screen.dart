import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../../../../controller/authentication/phone_number_controller.dart';
import '../../../../widgets/custom_text_field.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final controller = PhoneNumberController.find;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Image.asset(
                        MyImages.logoColored,
                        width: 150,
                        height: 75,
                      ),
                      // const SizedBox(),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: ScreenSize.phoneSize(
                      //       30,
                      //       height: false,
                      //     ),
                      //   ),
                      //   child: Container(
                      //     height: 67,
                      //   ),
                      // ),
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
                            'please enter your phone number'.tr,
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
                            'a verification code will be sent to the number'.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              color: MyColors.primary,
                            ),
                          ),
                        ),
                         SizedBox(
                          height: ScreenSize.phoneSize(40, height: true),
                        ),
                        CustomTextField(
                          controller: controller.countryCodeController,
                          readOnly: true,
                          color: MyColors.textFieldColor,
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: MyColors.primary,
                          ),
                          prefixIcon: SizedBox(
                            width: 60,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 18,
                                ),
                                Image.asset(
                                  MyImages.jordanFlag,
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
                        ),
                        const SizedBox(
                          height: 10,
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
                            LengthLimitingTextInputFormatter(
                              9,
                            ),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.fetchUpdateUserPhoneData(
                                phone: controller.phoneController.text,
                                id: MySharedPreferences.userId,
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
    );
  }
}
