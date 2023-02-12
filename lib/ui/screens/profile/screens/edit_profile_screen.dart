import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/my_account/my_account_controller.dart';
import 'package:yalla_mazad/controller/profile/profile_controller.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/account_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/edit_password_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/my_subscription_screen.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

import '../../../../utils/screen_size.dart';

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
          SafeArea(
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                primary: false,
                toolbarHeight: 35,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: FittedBox(
                  child: Text(
                    'edit account'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ),
                leadingWidth: 70,
                leading: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 35,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsetsDirectional.only(
                        start: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xffD3CFDC,
                        ),
                        borderRadius: BorderRadius.circular(
                          7,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: MyColors.primary,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GetBuilder<ProfileController>(
                                      builder: (value) {
                                    return InkWell(
                                      onTap: () {
                                        controller.pickImage(context);
                                        value.update();
                                        MyAccountController.find.update();
                                      },
                                      child: Container(
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
                                        ),
                                        child: CustomNetworkImage(
                                          url: MySharedPreferences.image,
                                          defaultUrl: MyImages.noProfile,
                                          radius: 100,
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: ScreenSize.phoneSize(
                                      170,
                                      height: false,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          MySharedPreferences.name,
                                          style: const TextStyle(
                                            color: MyColors.primary,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          '@${MySharedPreferences.userId}',
                                          textDirection: TextDirection.ltr,
                                          style: const TextStyle(
                                            color: MyColors.greyPrimary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.pageController.animateToPage(
                                            0,
                                            duration: const Duration(
                                                milliseconds: 500),
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
                                              color:
                                                  controller.currentIndex == 0
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
                                        controller.pageController.animateToPage(
                                            1,
                                            duration: const Duration(
                                                milliseconds: 500),
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
                                              color:
                                                  controller.currentIndex == 1
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
                                        controller.pageController.animateToPage(
                                            2,
                                            duration: const Duration(
                                                milliseconds: 500),
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
                                              color:
                                                  controller.currentIndex == 2
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
                            height: controller.currentIndex == 0 ? 1000 : 600,
                            child: PageView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: controller.pageController,
                              children: [
                                const MySubscriptionScreen(),
                                AccountScreen(),
                                EditPasswordScreen(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
