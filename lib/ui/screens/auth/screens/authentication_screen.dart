import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/authentication_controller.dart';
import 'package:yalla_mazad/ui/screens/auth/sign_up/screens/sign_up_screen.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../sign_in/screens/sign_in_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final controller = AuthenticationController.find;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.phoneSize(
                  30,
                  height: false,
                ),
              ),
              child: Container(
                height: 67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  color: const Color(
                    0xffD3CFDC,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                          setState(() {
                            controller.currentIndex = 0;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 5),
                          height: 56,
                          decoration: BoxDecoration(
                            color: controller.currentIndex == 0
                                ? MyColors.primary
                                : const Color(
                                    0xffD3CFDC,
                                  ),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'login'.tr,
                              style: TextStyle(
                                color: controller.currentIndex == 0
                                    ? Colors.white
                                    : MyColors.primary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                          setState(() {
                            controller.currentIndex = 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 5),
                          height: 56,
                          decoration: BoxDecoration(
                            color: controller.currentIndex == 1
                                ? MyColors.primary
                                : const Color(
                                    0xffD3CFDC,
                                  ),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'create account'.tr,
                              style: TextStyle(
                                color: controller.currentIndex == 1
                                    ? Colors.white
                                    : MyColors.primary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2 * MediaQuery.of(context).size.height / 2.3,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: [
                  const SignInScreen(),
                  SignUpScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
