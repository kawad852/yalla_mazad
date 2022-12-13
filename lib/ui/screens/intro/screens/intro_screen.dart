import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/authentication/authentication_binding.dart';
import 'package:yalla_mazad/ui/screens/auth/screens/authentication_screen.dart';
import 'package:yalla_mazad/ui/screens/intro/widgets/intro_card_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_slide_button.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';
import 'package:slide_to_act/slide_to_act.dart';

class IntroScreen extends StatelessWidget {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                _getCarColumn(),
                _getChairColumn(),
                _getIphoneColumn(),
                _getShirtColumn(),
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
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.phoneSize(
                30,
                height: false,
              ),
            ),
            child: Text(
              'Buy and sell, simply and securely'.tr,
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
                    text:
                        "Official real auctions that you can participate in with ease, register now and start participating in public auctions"
                            .tr,
                    style: const TextStyle(
                      color: MyColors.greyText,
                      fontSize: 18,
                    ),
                  ),
                  const TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: "Do not miss the opportunity".tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.phoneSize(
                40,
                height: false,
              ),
            ),
            child: CustomSlideButton(
              borderRadius: 25,
              height: ScreenSize.phoneSize(
                60,
                height: true,
              ),
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
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _getCarColumn() {
    return Column(
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
    );
  }

  _getChairColumn() {
    return Column(
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
    );
  }

  _getIphoneColumn() {
    return Column(
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
    );
  }

  _getShirtColumn() {
    return Column(
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
    );
  }
}
