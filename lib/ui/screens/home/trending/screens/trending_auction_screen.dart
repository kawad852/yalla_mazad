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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = TrendingAuctionController.find;
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
          PageView(
            controller: controller.pageController,
            children: List.generate(
              controller.popularAdvertisementModel?.data?.length ?? 0,
              (index) => TrendingAuctionItem(
                image:
                    controller.popularAdvertisementModel?.data?[index].image ??
                        '',
                name: controller.popularAdvertisementModel?.data?[index].name ??
                    '',
                user: controller
                        .popularAdvertisementModel?.data?[index].user?.name ??
                    '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
