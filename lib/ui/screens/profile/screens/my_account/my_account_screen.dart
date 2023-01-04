import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/my_account/my_account_controller.dart';
import 'package:yalla_mazad/model/my_badges/my_badges_model.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/edit_profile_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/my_account/my_auctions_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/my_account/my_favorites_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/widgets/badge_item.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../../../binding/profile/profile_binding.dart';
import '../../../../../controller/home/custom_navigation_bar_controller.dart';
import '../../../../../utils/screen_size.dart';
import '../../../../../utils/shared_prefrences.dart';
import '../../../../widgets/custom_network_image.dart';
import '../../../../widgets/failure_widget.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  void initState() {
    Get.put(MyAccountController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = MyAccountController.find;
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
                        onPressed: () {
                          CustomNavigationBarController.find.tabController
                              .jumpToTab(0);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: MyColors.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'my account'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xffD3CFDC,
                      ).withOpacity(
                        0.6,
                      ),
                      borderRadius: BorderRadius.circular(
                        7,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Get.to(
                            () => const EditProfileScreen(),
                            binding: ProfileBinding(),
                          );
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: MyColors.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: ScreenSize.phoneSize(
                    0,
                    height: false,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: (){
                              controller.pickImage();
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
                                radius: 100,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: ScreenSize.phoneSize(
                              170,
                              height: false,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                // Text(
                                //   'ahmad',
                                //   style: TextStyle(
                                //     color: MyColors.red,
                                //     fontSize: 18,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        'the badges'.tr,
                        style: const TextStyle(
                          color: MyColors.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 47,
                      child: Center(
                        child: FutureBuilder<MyBadgesModel?>(
                            future: controller.initializeMyBadgesFuture,
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                case ConnectionState.done:
                                default:
                                  if (snapshot.hasData) {
                                    return ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      itemCount:
                                          snapshot.data?.data?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return BadgeItem(
                                          image:
                                              snapshot.data?.data?[index].image,
                                          message: snapshot
                                              .data?.data?[index].id
                                              .toString(),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          width: 10,
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return const FailureWidget();
                                  } else {
                                    return const FailureWidget();
                                  }
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
                                'my auctions'.tr,
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
                                'favorites'.tr,
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
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: const [
                    MyAuctionsScreen(),
                    MyFavoritesScreen(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
