import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/subscriptions/subscriptions_binding.dart';
import 'package:yalla_mazad/controller/authentication/interests_controller.dart';
import 'package:yalla_mazad/ui/screens/auth/interests/widgets/interest_item.dart';
import 'package:yalla_mazad/ui/screens/subscriptions/screens/subscriptions_screen.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = InterestsController.find;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            right: -100,
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
                  Positioned(
                    right: 130,
                    top: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: MyColors.primary,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'congratulations'.tr,
                            style: const TextStyle(
                              color: MyColors.red,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'you have been registered successfully'.tr,
                            style: const TextStyle(
                              color: MyColors.primary,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'help us know your interests to give you the best'.tr,
                      style: const TextStyle(
                        color: MyColors.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 10,
                      children: const [
                        InterestItem(
                          content: 'cars',
                          isChosen: true,
                        ),
                        InterestItem(
                          content: 'cars',
                          isChosen: false,
                        ),
                        InterestItem(
                          content: 'cars cars c',
                          isChosen: true,
                        ),
                        InterestItem(
                          content: 'cars',
                          isChosen: true,
                        ),
                      ],
                    ),
                  ],
                ),
                const Expanded(flex: 2, child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const SubscriptionsScreen(),
                      binding: SubscriptionsBinding(),
                    );
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
                        'next'.tr,
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
        ],
      ),
    );
  }
}
