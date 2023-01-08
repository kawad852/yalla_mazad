import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:yalla_mazad/controller/auctions/current_auction_controller.dart';
import 'package:yalla_mazad/ui/screens/home/auctions/widgets/auction_item.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/screen_size.dart';
import '../../../widgets/custom_slide_button.dart';

class ConfirmAuctionDialog extends StatelessWidget {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  final int id;
  final int priceOne;
  final int priceTwo;
  final int priceThree;
  final int currentPrice;
  ConfirmAuctionDialog({
    Key? key,
    required this.id,
    required this.currentPrice,
    required this.priceOne,
    required this.priceTwo,
    required this.priceThree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CurrentAuctionController.find;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: ScreenSize.phoneSize(
          354,
          height: false,
        ),
        height: ScreenSize.phoneSize(
          415,
          height: false,
        ),
        padding: const EdgeInsets.only(
          top: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: MyColors.red,
                    ),
                  ),
                  Text(
                    'auction'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      color: MyColors.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: Column(
                children: [
                  Text(
                    'current price'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: 133,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: MyColors.textFieldColor,
                    ),
                    child: Center(
                      child: Text(
                        '$currentPrice JOD',
                        style: const TextStyle(
                          color: MyColors.red,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
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
                        'your auction amount'.tr,
                        style: const TextStyle(
                          color: MyColors.primary,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GetBuilder<CurrentAuctionController>(builder: (value) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            value.selectedBidItem = 1;
                            value.selectedBidAmount = priceOne;
                            value.update();
                          },
                          child: AuctionBidItem(
                            content: '$priceOne JOD',
                            isChosen: controller.selectedBidItem == 1,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            value.selectedBidItem = 2;
                            value.selectedBidAmount = priceTwo;
                            value.update();
                          },
                          child: AuctionBidItem(
                            content: '$priceTwo JOD',
                            isChosen: controller.selectedBidItem == 2,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            value.selectedBidItem = 3;
                            value.selectedBidAmount = priceThree;
                            value.update();
                          },
                          child: AuctionBidItem(
                            content: '$priceThree JOD',
                            isChosen: controller.selectedBidItem == 3,
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: Column(
                children: [
                  Text(
                    'your auction'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: 133,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: MyColors.primary,
                    ),
                    child:
                        GetBuilder<CurrentAuctionController>(builder: (value) {
                      return Center(
                        child: Text(
                          '${currentPrice + value.selectedBidAmount} JOD',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            CustomSlideButton(
              borderRadius: 25,
              height: ScreenSize.phoneSize(
                60,
                height: true,
              ),
              color: MyColors.primary,
              stateKey: _key,
              text: 'confirm'.tr,
              onSubmitted: () {
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    _key.currentState?.reset();

                    ///TODO: edit
                    Get.back();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
