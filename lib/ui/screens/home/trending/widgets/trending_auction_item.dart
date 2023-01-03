import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/auctions/current_auction_binding.dart';
import 'package:yalla_mazad/ui/screens/auctions/screens/current_auction.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';

import '../../../../../binding/notifications/notifications_binding.dart';
import '../../../../../controller/home/custom_navigation_bar_controller.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/images.dart';
import '../../../auctions/screens/test.dart';
import '../../../notifications/screens/notifications_screen.dart';

class TrendingAuctionItem extends StatelessWidget {
  final String image;
  final String name;
  final String user;
  final String id;
  const TrendingAuctionItem({
    required this.name,
    required this.image,
    required this.user,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          Get.to(() => Test());
                          // CustomNavigationBarController.find.tabController
                          //     .jumpToTab(0);
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
                    'trending auctions'.tr,
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
                        onPressed: () {
                          Get.to(
                            () => const NotificationsScreen(),
                            binding: NotificationsBinding(),
                          );
                        },
                        icon: Image.asset(
                          MyImages.notification,
                          width: 20,
                          height: 20,
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
                  child: InkWell(
                    onTap: () {
                      Get.to(() => const CurrentAuctionScreen(),
                          binding: CurrentAuctionBinding(), arguments: id);
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
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const CurrentAuctionScreen(),
                        binding: CurrentAuctionBinding(), arguments: id);
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
