import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/trending/trending_auction_controller.dart';
import 'package:yalla_mazad/ui/screens/home/trending/widgets/trending_auction_item.dart';
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
          SizedBox(
            width: Get.width,
            child: GetBuilder<TrendingAuctionController>(
              builder: (value) {
                return SizedBox(
                  width: Get.width,
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      if (index == controller.popularAdsItems.length - 1) {
                        controller.fetchTrendingPage(
                          controller.trendingPagingController.nextPageKey!,
                        );
                      }
                      value.update();
                      // print(controller.popularAdsItems.length);
                    },
                    children: List.generate(
                      controller.popularAdsItems.length,
                      (index) => TrendingAuctionItem(
                        image: controller.popularAdsItems[index].image ?? '',
                        name: controller.trendingPagingController
                                .itemList?[index].name ??
                            '',
                        user: controller.trendingPagingController
                                .itemList?[index].user?.name ??
                            '',
                        id: controller
                                .trendingPagingController.itemList?[index].id
                                .toString() ??
                            '0',
                      ),
                    ),
                  ),
                );
              },
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
