import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/drawer/terms_and_conditions_controller.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final controller = TermsAndConditionsController.find;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            right: Get.locale == const Locale('ar') ? -100 : null,
            left: Get.locale == const Locale('en') ? -100 : null,
            top: -50,
            child: Align(
              alignment: Alignment.topRight,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    MyImages.circleBackground,
                    width: 300,
                    height: 350,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              left: 20,
              right: 20,
            ),
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'service conditions'.tr,
                      style: const TextStyle(
                        fontSize: 28,
                        color: MyColors.primary,
                      ),
                    ),
                    Row(
                      children: [
                        GetBuilder<TermsAndConditionsController>(builder: (v) {
                          return Checkbox(
                            activeColor: MyColors.primary,
                            value: v.isCheckedFirst,
                            onChanged: (value) {
                              v.isCheckedFirst = !v.isCheckedFirst;
                              v.update();
                            },
                          );
                        }),
                        Expanded(
                          child: Text(
                            'I agree to the terms and conditions'.tr,
                            style: const TextStyle(
                              fontSize: 14,
                              color: MyColors.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GetBuilder<TermsAndConditionsController>(builder: (v) {
                          return Checkbox(
                            activeColor: MyColors.primary,
                            value: v.isCheckedSecond,
                            onChanged: (value) {
                              v.isCheckedSecond = !v.isCheckedSecond;
                              v.update();
                            },
                          );
                        }),
                        Expanded(
                          child: Text(
                            'I agree to the privacy policy'.tr,
                            style: const TextStyle(
                              fontSize: 14,
                              color: MyColors.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: ScreenSize.phoneSize(
                              160,
                              height: false,
                            ),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              border: Border.all(
                                color: MyColors.primary,
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  'decline'.tr,
                                  style: TextStyle(
                                    color: MyColors.primary,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: ScreenSize.phoneSize(
                              160,
                              height: false,
                            ),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              color: MyColors.primary,
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  'accept'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
