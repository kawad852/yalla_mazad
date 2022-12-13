import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/profile_controller.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/account_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/edit_password_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/my_subscription_screen.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final controller = ProfileController.find;
  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xffD3CFDC,
                      ),
                      borderRadius: BorderRadius.circular(
                        7,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: MyColors.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'edit account'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
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
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    _getProfileRow(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                _getChoiceContainer(),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    children: [
                      MySubscriptionScreen(),
                      AccountScreen(),
                      EditPasswordScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getChoiceContainer(){
    return  Container(
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
                    'subscription'.tr,
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
                    'account'.tr,
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
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller.pageController.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
                setState(() {
                  controller.currentIndex = 2;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 1, horizontal: 5),
                height: 56,
                decoration: BoxDecoration(
                  color: controller.currentIndex == 2
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
                    'password'.tr,
                    style: TextStyle(
                      color: controller.currentIndex == 2
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
    );
  }
  _getProfileRow() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 114,
            height: 114,
            decoration: BoxDecoration(
              color: const Color(
                0xffD3CFDC,
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(
                  0xffD3CFDC,
                ),
                width: 8,
              ),

              ///TODO: change image (from api)
              image: DecorationImage(
                image: AssetImage(
                  MyImages.introTeapot,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'ahmad',
                  style: TextStyle(
                    color: MyColors.primary,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'ahmad',
                  style: TextStyle(
                    color: MyColors.greyPrimary,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'ahmad',
                  style: TextStyle(
                    color: MyColors.red,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
