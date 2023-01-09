import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/home/auctions_by_category_binding.dart';
import 'package:yalla_mazad/controller/home/custom_navigation_bar_controller.dart';
import 'package:yalla_mazad/controller/home/home/home_controller.dart';
import 'package:yalla_mazad/controller/home/trending/trending_auction_controller.dart';
import 'package:yalla_mazad/model/all_advertisements/all_advertiements_model.dart';
import 'package:yalla_mazad/model/popular_advertisement/popular_advertisement_model.dart';
import 'package:yalla_mazad/ui/screens/home/auctions/screens/auctions_by_category/auctions_by_category_screen.dart';
import 'package:yalla_mazad/ui/screens/home/home/widgets/auction_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../../../binding/notifications/notifications_binding.dart';
import '../../../../widgets/custom_category_item.dart';
import '../../../../widgets/failure_widget.dart';
import '../../../notifications/screens/notifications_screen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
                    left: 35,
                    right: 35,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.advancedDrawerController.showDrawer();
                        },
                        icon: RotatedBox(
                          quarterTurns:
                              Get.locale == const Locale('ar') ? 0 : 2,
                          child: Image.asset(
                            MyImages.drawerMenu,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(
                              202,
                              195,
                              212,
                              0.3,
                            ),
                            borderRadius: BorderRadius.circular(
                              7,
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Get.to(
                                  () => const NotificationsScreen(),
                                  binding: NotificationsBinding(),
                                );
                              },
                              icon: Image.asset(
                                MyImages.notification,
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ),
                ),
                SizedBox(
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
                                      controller.sliderModel?.data?.length ?? 0,
                                      (index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        height: 190,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
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
                                      reverse: true,
                                      autoPlay: true,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return const FailureWidget();
                                } else {
                                  return const FailureWidget();
                                }
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: FutureBuilder(
                            future: controller.initializeTipsFuture,
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
                                        controller.allTipsModel?.data?.length ??
                                            0,
                                        (index) => Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                          ),
                                          height: 67,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                            color: MyColors.primary,
                                          ),
                                          child: Center(
                                            child: Text(
                                              snapshot.data?.data?[index]
                                                      .note ??
                                                  '',
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        height: 67,
                                        reverse: true,
                                        autoPlay: true,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return const FailureWidget();
                                  } else {
                                    return const FailureWidget();
                                  }
                              }
                            }),
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
                                        return InkWell(
                                          onTap: () {
                                            controller.category = MapEntry(
                                                controller.categoriesModel
                                                        ?.data?[index].name ??
                                                    '',
                                                controller.categoriesModel
                                                        ?.data?[index].id ??
                                                    0);
                                            Get.to(
                                                () =>
                                                    const AuctionsByCategoryScreen(),
                                                binding:
                                                    AuctionsByCategoryBinding());
                                          },
                                          child: CustomCategoryItem(
                                            url: controller.categoriesModel
                                                    ?.data?[index].image ??
                                                '',
                                            name: controller.categoriesModel
                                                    ?.data?[index].name ??
                                                '',
                                          ),
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
                                  return const FailureWidget();
                                } else {
                                  return const FailureWidget();
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
                        child: PagedListView<int, PopularAdsList>.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          scrollDirection: Axis.horizontal,
                          pagingController: controller.trendingPagingController,
                          builderDelegate:
                              PagedChildBuilderDelegate<PopularAdsList>(
                            newPageProgressIndicatorBuilder: (context) =>
                                const Center(
                              child: CircularProgressIndicator(),
                            ),
                            firstPageProgressIndicatorBuilder: (context) =>
                                const Center(
                              child: CircularProgressIndicator(),
                            ),
                            itemBuilder: (context, data, index) {
                              return InkWell(
                                child: AuctionItem(
                                  image: data.image,
                                  name: data.name,
                                  user: data.user?.name,
                                  price: '${data.startPrice.toString()} JOD',
                                ),
                                onTap: () {
                                  controller.selectedIndex = index;
                                  CustomNavigationBarController
                                      .find.tabController
                                      .jumpToTab(3);
                                  Future.delayed(
                                    const Duration(milliseconds: 50),
                                    () {
                                      if (TrendingAuctionController
                                              .find.pageController.hasClients &&
                                          TrendingAuctionController
                                                  .find
                                                  .pageController
                                                  .positions
                                                  .length <=
                                              1) {
                                        TrendingAuctionController
                                            .find.pageController
                                            .jumpToPage(
                                                controller.selectedIndex);
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
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
                        child: PagedListView<int, AllAdsList>.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          scrollDirection: Axis.horizontal,
                          pagingController: controller.allAdsPagingController,
                          builderDelegate:
                              PagedChildBuilderDelegate<AllAdsList>(
                            newPageProgressIndicatorBuilder: (context) =>
                                const Center(
                              child: CircularProgressIndicator(),
                            ),
                            firstPageProgressIndicatorBuilder: (context) =>
                                const Center(
                              child: CircularProgressIndicator(),
                            ),
                            itemBuilder: (context, data, index) {
                              return InkWell(
                                child: AuctionItem(
                                  image: data.image,
                                  name: data.name,
                                  user: data.user?.name,
                                  price: '${data.startPrice.toString()} JOD',
                                ),
                                onTap: () {
                                  controller.selectedIndex = index;
                                  CustomNavigationBarController
                                      .find.tabController
                                      .jumpToTab(3);
                                  Future.delayed(
                                    const Duration(milliseconds: 50),
                                    () {
                                      if (TrendingAuctionController
                                          .find.pageController.hasClients) {
                                        TrendingAuctionController
                                            .find.pageController
                                            .jumpToPage(
                                                controller.selectedIndex);
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
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
