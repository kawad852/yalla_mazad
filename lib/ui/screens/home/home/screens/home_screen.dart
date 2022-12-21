import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/home_controller.dart';
import 'package:yalla_mazad/ui/screens/home/home/widgets/auction_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../../widgets/custom_category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController.find;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
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
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 20,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///TODO: edit
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: MyColors.primary,
                            size: 25,
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
                            ///TODO: edit
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_outlined,
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
                SizedBox(
                  // height: Get.height * 3 / 2.4,
                  height: 1200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      FutureBuilder(
                          future: controller.initializeSliderFuture,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.done:
                              default:
                                if (snapshot.hasData) {
                                  return CarouselSlider(
                                      items: List.generate(
                                        controller.sliderModel?.data?.length ??
                                            0,
                                        (index) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          height: 190,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                            // image: const DecorationImage(
                                            //   image: AssetImage(
                                            //     MyImages.introChair,
                                            //   ),
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                          child: CustomNetworkImage(
                                            url: controller.sliderModel
                                                    ?.data?[index].image ??
                                                '',
                                            radius: 25,
                                          ),
                                        ),
                                      ),
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                      ));
                                } else if (snapshot.hasError) {
                                  ///TODO: failure widget
                                  return const Text('error');
                                } else {
                                  return const Text('error');
                                }
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          ///TODO: notes from back
                          height: 67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                            color: MyColors.primary,
                          ),
                          child: const Center(
                            child: Text(
                              '“لا تنسى توثيق حسابك من خلال الهوية”',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              MyImages.justice,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'categories'.tr,
                              style: const TextStyle(
                                  color: MyColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: controller.initializeCategoriesFuture,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                    child: CircularProgressIndicator());
                              case ConnectionState.done:
                              default:
                                if (snapshot.hasData) {
                                  return SizedBox(
                                    height: 100,
                                    child: ListView.separated(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                              .categoriesModel?.data?.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        return CustomCategoryItem(
                                          url: controller.categoriesModel
                                                  ?.data?[index].image ??
                                              '',
                                          name: controller.categoriesModel
                                                  ?.data?[index].name ??
                                              '',
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          width: 10,
                                        );
                                      },
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  ///TODO: failure widget
                                  return const Text('error');
                                } else {
                                  return const Text('error');
                                }
                            }
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              MyImages.justice,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'trending auctions'.tr,
                              style: const TextStyle(
                                color: MyColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 247,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return AuctionItem(
                              image: 'img/16704982118127.jpg',
                              name: 'abc',
                              user: '/def',
                              price: '120 jod',
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10,
                            );
                          },
                          itemCount: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              MyImages.justice,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'you may also like'.tr,
                              style: const TextStyle(
                                color: MyColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 247,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return AuctionItem(
                              image: 'img/16704982118127.jpg',
                              name: 'abc',
                              user: '/def',
                              price: '120 jod',
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10,
                            );
                          },
                          itemCount: 10,
                        ),
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
