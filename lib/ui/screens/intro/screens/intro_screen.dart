import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/authentication/authentication_binding.dart';
import 'package:yalla_mazad/controller/introduction/introduction_controller.dart';
import 'package:yalla_mazad/model/introduction/introduction_model.dart';
import 'package:yalla_mazad/ui/screens/intro/widgets/intro_card_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_slide_button.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../../widgets/failure_widget.dart';
import '../../authentication/screens/authentication_screen.dart';

class IntroScreen extends StatelessWidget {
  final GlobalKey<SlideActionState> _key = GlobalKey();

  IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = IntroductionController.find;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.aspectRatio < 0.5
                ? MediaQuery.of(context).size.height * 0.46
                : MediaQuery.of(context).size.height * 0.51,
            child: CarouselSlider(
              items: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IntroCardItem(
                      width: ScreenSize.phoneSize(
                        250,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        250,
                        height: false,
                      ),
                      image: MyImages.introCar,
                    ),
                    IntroCardItem(
                      width: ScreenSize.phoneSize(
                        250,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        114,
                        height: true,
                      ),
                      image: MyImages.introWatch,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IntroCardItem(
                          width: ScreenSize.phoneSize(
                            110,
                            height: false,
                          ),
                          height: ScreenSize.phoneSize(
                            110,
                            height: false,
                          ),
                          image: MyImages.introChair,
                        ),
                        IntroCardItem(
                          width: ScreenSize.phoneSize(
                            110,
                            height: false,
                          ),
                          height: ScreenSize.phoneSize(
                            110,
                            height: false,
                          ),
                          image: MyImages.introLaptop,
                        ),
                      ],
                    ),
                    IntroCardItem(
                      width: ScreenSize.phoneSize(
                        253,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        253,
                        height: false,
                      ),
                      image: MyImages.introJoystick,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IntroCardItem(
                      width: ScreenSize.phoneSize(
                        250,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        250,
                        height: false,
                      ),
                      image: MyImages.introIphone,
                    ),
                    IntroCardItem(
                      width: ScreenSize.phoneSize(
                        250,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        114,
                        height: true,
                      ),
                      image: MyImages.introCamera,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IntroCardItem(
                          width: ScreenSize.phoneSize(
                            110,
                            height: false,
                          ),
                          height: ScreenSize.phoneSize(
                            110,
                            height: false,
                          ),
                          image: MyImages.introShirt,
                        ),
                        IntroCardItem(
                          width: ScreenSize.phoneSize(
                            110,
                            height: false,
                          ),
                          height: ScreenSize.phoneSize(
                            110,
                            height: false,
                          ),
                          image: MyImages.introTeapot,
                        ),
                      ],
                    ),
                    IntroCardItem(
                      width: ScreenSize.phoneSize(
                        253,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        253,
                        height: false,
                      ),
                      image: MyImages.introBoots,
                    ),
                  ],
                ),
              ],
              options: CarouselOptions(
                clipBehavior: Clip.none,
                height: MediaQuery.of(context).size.aspectRatio < 0.5
                    ? MediaQuery.of(context).size.height * 0.46
                    : MediaQuery.of(context).size.height * 0.51,
                disableCenter: true,
                viewportFraction: 0.66,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(
                  seconds: 2,
                ),
              ),
            ),
          ),
          FutureBuilder<IntroductionModel?>(
              future: controller.initializeIntroductionFuture,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenSize.phoneSize(
                                30,
                                height: false,
                              ),
                            ),
                            child: Text(
                              controller.introductionModel?.data?[0].title ??
                                  '',
                              maxLines: 3,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.primary,
                                fontSize: 45,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenSize.phoneSize(
                                50,
                                height: false,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: controller
                                            .introductionModel?.data?[0].body ??
                                        '',
                                    style: const TextStyle(
                                      color: MyColors.greyText,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '\n',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const FailureWidget();
                    } else {
                      return const FailureWidget();
                    }
                }
              }),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.phoneSize(
                40,
                height: false,
              ),
            ),
            child: CustomSlideButton(
              borderRadius: 25,
              height: 67,
              color: MyColors.primary,
              stateKey: _key,
              text: 'yalla mazad'.tr,
              onSubmitted: () {
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    Get.to(
                      () => const AuthenticationScreen(),
                      binding: AuthenticationBinding(),
                    );
                    _key.currentState?.reset();
                    MySharedPreferences.isPassedIntro = true;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
