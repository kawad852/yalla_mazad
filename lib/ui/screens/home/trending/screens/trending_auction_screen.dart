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
  void dispose() {
    Get.delete<TrendingAuctionController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                priceOne: value.trendingPagingController
                                        .itemList?[index].priceOne ??
                                    0,
                                priceTwo: value.trendingPagingController
                                        .itemList?[index].priceTwo ??
                                    0,
                                priceThree: value.trendingPagingController
                                        .itemList?[index].priceThree ??
                                    0,
                                isBack: false,
                                startPrice: value.trendingPagingController
                                        .itemList?[index].startPrice
                                        .toString() ??
                                    '0',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
