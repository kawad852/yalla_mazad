import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/notifications/notifications_binding.dart';
import 'package:yalla_mazad/controller/home/custom_navigation_bar_controller.dart';
import 'package:yalla_mazad/controller/home/trending/trending_auction_controller.dart';
import 'package:yalla_mazad/ui/screens/home/trending/widgets/trending_auction_item.dart';
import 'package:yalla_mazad/ui/screens/notifications/screens/notifications_screen.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

class TrendingAuctionScreen extends StatefulWidget {
  const TrendingAuctionScreen({Key? key}) : super(key: key);

  @override
  State<TrendingAuctionScreen> createState() => _TrendingAuctionScreenState();
}

class _TrendingAuctionScreenState extends State<TrendingAuctionScreen> {
  @override
  void initState() {
    Get.put(TrendingAuctionController());
    controller = TrendingAuctionController.find;
    super.initState();
  }

  late final TrendingAuctionController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'trending auctions'.tr,
          style: const TextStyle(
            color: MyColors.primary,
            fontSize: 18,
          ),
        ),
        leadingWidth: 72,
        leading: GestureDetector(
          onTap: () {
            CustomNavigationBarController.find.tabController.jumpToTab(0);
          },
          child: Container(
            width: 35,
            height: 35,
            margin: const EdgeInsetsDirectional.only(start: 37),
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
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(
                () => const NotificationsScreen(),
                binding: NotificationsBinding(),
              );
            },
            child: Container(
              width: 35,
              height: 35,
              margin: const EdgeInsetsDirectional.only(end: 37),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(202, 195, 212, 0.3),
                borderRadius: BorderRadius.circular(
                  7,
                ),
              ),
              child: Center(
                child: Image.asset(
                  MyImages.notification,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      ),
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
          Obx(
            () => controller.isLoading.value
                ? SizedBox(
                    height: Get.height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox(
                    width: Get.width,
                    child: GetBuilder<TrendingAuctionController>(
                      builder: (value) {
                        return SizedBox(
                          width: Get.width,
                          child: PageView(
                            controller: value.pageController,
                            onPageChanged: (index) {
                              if (index == value.popularAdsItems.length - 1 &&
                                  !controller.isFinalPage) {
                                value.fetchTrendingPage(
                                  value.trendingPagingController.nextPageKey!,
                                );
                              }
                              value.update();
                            },
                            children: List.generate(
                              value.popularAdsItems.length,
                              (index) => TrendingAuctionItem(
                                image: value.popularAdsItems[index].image ?? '',
                                name: value.trendingPagingController
                                        .itemList?[index].name ??
                                    '',
                                user: value.trendingPagingController
                                        .itemList?[index].user?.name ??
                                    '',
                                id: value.trendingPagingController
                                        .itemList?[index].id
                                        .toString() ??
                                    '0',
                                startDate: value.trendingPagingController
                                        .itemList?[index].startDate ??
                                    '',
                                endDate: value.trendingPagingController
                                        .itemList?[index].endDate ??
                                    '',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),

          // FutureBuilder<PopularAdvertisementModel?>(
          //     future: controller.initializePopularAdsFuture,
          //     builder: (context, snapshot) {
          //       switch (snapshot.connectionState) {
          //         case ConnectionState.waiting:
          //           return const Center(
          //             child: CircularProgressIndicator(),
          //           );
          //         case ConnectionState.done:
          //         default:
          //           if (snapshot.hasData) {
          //             return PageView(
          //               controller: controller.pageController,
          //               children: List.generate(
          //                 snapshot.data?.data?.length ?? 0,
          //                 (index) => TrendingAuctionItem(
          //                   image: snapshot.data?.data?[index].image ?? '',
          //                   name: snapshot.data?.data?[index].name ?? '',
          //                   user: snapshot.data?.data?[index].user?.name ?? '',
          //                   id: snapshot.data?.data?[index].id.toString() ??
          //                       '0',
          //                 ),
          //               ),
          //             );
          //           } else if (snapshot.hasError) {
          //             return const FailureWidget();
          //           } else {
          //             return const FailureWidget();
          //           }
          //       }
          //     }),
        ],
      ),
    );
  }
}
