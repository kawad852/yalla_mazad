import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/drawer/call_us_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

class CallUsScreen extends StatefulWidget {
  const CallUsScreen({Key? key}) : super(key: key);

  @override
  State<CallUsScreen> createState() => _CallUsScreenState();
}

class _CallUsScreenState extends State<CallUsScreen> {
  final controller = CallUsController.find;
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
              top: 55,
              left: 35,
              right: 35,
            ),
            child: SizedBox(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'call us'.tr,
                        style: const TextStyle(
                          fontSize: 20,
                          color: MyColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'we are here for you! how can we help?'.tr,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 20,
                            color: MyColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
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
                          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
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
                    controller: controller.messageController,
                    color: MyColors.textFieldColor,
                    maxLines: 10,
                    validator: (text) {
                      if (text == '' || text!.isEmpty) {
                        return 'cannot be empty'.tr;
                      }
                      return null;
                    },
                    prefixIcon: Container(
                      width: 60,
                      height: 240,
                      padding: const EdgeInsets.only(bottom: 180),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 18,
                          ),
                          const Icon(
                            Icons.message_outlined,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
