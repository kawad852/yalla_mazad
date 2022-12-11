import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/ui/screens/registration/sign_in/sign_in_screen.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 5),
                            height: 56,
                            decoration: BoxDecoration(
                              // color: const Color(
                              //   0xffD3CFDC,
                              // ),
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'login'.tr,
                                style: const TextStyle(
                                  color: MyColors.primary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 5),
                            height: 56,
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'create account'.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: PageView(
              children: [
                SignInScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
