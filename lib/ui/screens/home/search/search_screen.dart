import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/custom_navigation_bar_controller.dart';
import 'package:yalla_mazad/controller/home/search_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SearchController.find;
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
                    color: MyColors.textFieldColor,
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          padding: const EdgeInsets.only(
                            right: 4,
                          ),
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
                                CustomNavigationBarController.find.tabController.jumpToTab(0);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: MyColors.primary,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'search'.tr,
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(202, 195, 212, 0.3),
                            borderRadius: BorderRadius.circular(
                              7,
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                MyImages.notification,
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: CustomTextField(
                          controller: controller.searchController,
                          color: MyColors.primary5D0,
                          hint: 'what do you want to search for?'.tr,
                          suffixIcon: const Icon(
                            Icons.search_sharp,
                            color: MyColors.primary,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
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
}
