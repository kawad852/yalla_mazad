import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/authentication/authentication_binding.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../screens/authentication_screen.dart';

class ResetPasswordCongratsScreen extends StatefulWidget {
  const ResetPasswordCongratsScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordCongratsScreen> createState() =>
      _ResetPasswordCongratsScreenState();
}

class _ResetPasswordCongratsScreenState
    extends State<ResetPasswordCongratsScreen> {
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
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: ScreenSize.phoneSize(
                      280,
                      height: true,
                    ),
                    width: ScreenSize.phoneSize(
                      280,
                      height: false,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          MyImages.congrats,
                          width: ScreenSize.phoneSize(
                            250,
                            height: true,
                          ),
                          height: ScreenSize.phoneSize(
                            250,
                            height: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
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
                              'your password has been reset successfully'.tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: MyColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Get.offAll(() => const AuthenticationScreen(),
                                  binding: AuthenticationBinding());
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
