import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/profile/profile_binding.dart';
import 'package:yalla_mazad/controller/plans/plans_controller.dart';
import 'package:yalla_mazad/ui/screens/plans/widgets/plan_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_navigation_bar.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = PlansController.find;
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
          SingleChildScrollView(
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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: MyColors.primary,
                            size: 25,
                          ),
                        ),
                        Text(
                          'subscriptions'.tr,
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
                SizedBox(
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: RichText(
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
                                      text:
                                          'you\'ve got a free subscription, valid for one auction'
                                              .tr,
                                      style: const TextStyle(
                                        color: MyColors.primary,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Text(
                                        'you can change your subscription to any other subscription at any time'
                                            .tr,
                                        style: const TextStyle(
                                          color: MyColors.primary,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            'subscriptions'.tr,
                                            style: const TextStyle(
                                              color: MyColors.primary,
                                              fontSize: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    FutureBuilder(
                                        future:
                                            controller.initializePlansFuture,
                                        builder: (context, snapshot) {
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting:
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            case ConnectionState.done:
                                            default:
                                              if (snapshot.hasData) {
                                                return CarouselSlider(
                                                  items: List.generate(
                                                      snapshot.data?.data
                                                              ?.length ??
                                                          0,
                                                      (index) => Opacity(
                                                          opacity: controller
                                                                      .pageIndex ==
                                                                  index
                                                              ? 1
                                                              : 0.5,
                                                          child: PlanItem(
                                                            price: snapshot
                                                                .data
                                                                ?.data?[index]
                                                                .price,
                                                            name: snapshot
                                                                .data
                                                                ?.data?[index]
                                                                .name,
                                                            details: snapshot
                                                                .data
                                                                ?.data?[index]
                                                                .details,
                                                            numberOfAuctions:
                                                                snapshot
                                                                    .data
                                                                    ?.data?[
                                                                        index]
                                                                    .numberOfAuction,
                                                          ))),
                                                  options: CarouselOptions(
                                                    onPageChanged: (index, x) {
                                                      setState(() {
                                                        controller.pageIndex =
                                                            index;
                                                      });
                                                    },
                                                    //aspectRatio: 3/3,
                                                    enableInfiniteScroll: false,
                                                    height: 400,
                                                    viewportFraction: 0.8,
                                                    enlargeCenterPage: true,
                                                    initialPage: 0,
                                                    autoPlay: false,
                                                    enlargeFactor: 0.2,
                                                    autoPlayInterval:
                                                        const Duration(
                                                      milliseconds: 1000,
                                                    ),
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
                                      height: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          ///TODO: make sure of binding
                                          Get.to(
                                            () => const CustomNavigationBar(),
                                            binding: ProfileBinding(),
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
                                              'home screen'.tr,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
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
                            ),
                          ],
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
