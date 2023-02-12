import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/auctions/coming_auction_binding.dart';
import 'package:yalla_mazad/binding/auctions/current_auction_binding.dart';
import 'package:yalla_mazad/binding/auctions/done_auction_binding.dart';
import 'package:yalla_mazad/ui/screens/auctions/screens/coming_auction.dart';
import 'package:yalla_mazad/ui/screens/auctions/screens/current_auction.dart';
import 'package:yalla_mazad/ui/screens/auctions/screens/done_auction.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';

import '../../../../../binding/notifications/notifications_binding.dart';
import '../../../../../controller/home/custom_navigation_bar_controller.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/images.dart';
import '../../../notifications/screens/notifications_screen.dart';

class TrendingAuctionItem extends StatelessWidget {
  final String image;
  final String name;
  final String user;
  final String id;
  final String startDate;
  final String endDate;
  final int priceOne;
  final int priceTwo;
  final int priceThree;
  final bool isBack;
  final String startPrice;

  const TrendingAuctionItem({
    required this.name,
    required this.image,
    required this.user,
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.priceOne,
    required this.priceTwo,
    required this.priceThree,
    required this.isBack,
    required this.startPrice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              'trending auctions'.tr,
              style: const TextStyle(
                color: MyColors.primary,
                fontSize: 18,
              ),
            ),
          ),
          leadingWidth: 72,
          leading: GestureDetector(
            onTap: () {
              isBack
                  ? Get.back()
                  : CustomNavigationBarController.find.tabController
                      .jumpToTab(0);
            },
            child: Container(
              width: 35,
              height: 35,
              padding: const EdgeInsetsDirectional.only(
                start: 3,
              ),
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
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: InkWell(
                          onTap: () {
                            log(startDate);
                            log(endDate);
                            int startDifference = DateTime.parse(startDate)
                                .difference(DateTime.now())
                                .inSeconds;
                            int endDifference = DateTime.now()
                                .difference(DateTime.parse(endDate))
                                .inSeconds;
                            if (startDifference >= 1) {
                              log('coming');
                              Get.to(
                                () => const ComingAuctionScreen(),
                                binding: ComingAuctionBinding(),
                                arguments: id,
                              );
                            } else if (startDifference <= 0 &&
                                endDifference <= 0) {
                              log('current');
                              Get.to(
                                () => const CurrentAuctionScreen(),
                                binding: CurrentAuctionBinding(),
                                arguments: [
                                  id,
                                  priceOne,
                                  priceTwo,
                                  priceThree,
                                  startPrice,
                                ],
                              );
                            } else if (endDifference >= 1) {
                              log('done');
                              Get.to(
                                () => const DoneAuctionScreen(),
                                binding: DoneAuctionBinding(),
                                arguments: id,
                              );
                            }
                          },
                          child: Container(
                            height: 3 * MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            child: CustomNetworkImage(
                              radius: 25,
                              url: image,
                              defaultUrl: MyImages.logo,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          int startDifference = DateTime.parse(startDate)
                              .difference(DateTime.now())
                              .inSeconds;
                          int endDifference = DateTime.now()
                              .difference(DateTime.parse(endDate))
                              .inSeconds;
                          if (startDifference >= 1) {
                            Get.to(
                              () => const ComingAuctionScreen(),
                              binding: ComingAuctionBinding(),
                              arguments: id,
                            );
                          } else if (startDifference <= 0 &&
                              endDifference <= 0) {
                            Get.to(
                              () => const CurrentAuctionScreen(),
                              binding: CurrentAuctionBinding(),
                              arguments: [
                                id,
                                priceOne,
                                priceTwo,
                                priceThree,
                                startPrice,
                              ],
                            );
                          } else if (endDifference >= 1) {
                            Get.to(
                              () => const DoneAuctionScreen(),
                              binding: DoneAuctionBinding(),
                              arguments: id,
                            );
                          }
                        },
                        child: Text(
                          name,
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user,
                        style: const TextStyle(
                          color: Color(
                            0xff333333,
                          ),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
