import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/auctions/current_auction_controller.dart';
import 'package:yalla_mazad/ui/screens/home/auctions/widgets/auction_bid_item.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/screen_size.dart';
import '../../../widgets/custom_slide_button.dart';

class ConfirmAuctionDialog extends StatefulWidget {
  final int id;
  final int priceOne;
  final int priceTwo;
  final int priceThree;
  final String startPrice;

  const ConfirmAuctionDialog({
    Key? key,
    required this.id,
    required this.priceOne,
    required this.priceTwo,
    required this.priceThree,
    required this.startPrice,
  }) : super(key: key);

  @override
  State<ConfirmAuctionDialog> createState() => _ConfirmAuctionDialogState();
}

class _ConfirmAuctionDialogState extends State<ConfirmAuctionDialog> {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  final controller = CurrentAuctionController.find;

  @override
  Widget build(BuildContext context) {
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
        child: GetBuilder<CurrentAuctionController>(builder: (cont) {
          return Column(
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
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('auctions')
                              .doc(widget.id.toString())
                              .collection('biddings')
                              .orderBy('amount', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text(
                                'an error occured'.tr,
                              );
                            }
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center();
                              default:
                                {
                                  controller.currentPrice =
                                      snapshot.data!.docs.isNotEmpty
                                          ? snapshot.data?.docs.first
                                                  .get('amount')
                                                  .toString()
                                                  .obs ??
                                              widget.startPrice.obs
                                          : widget.startPrice.obs;
                                }

                                return Text(
                                  snapshot.data!.docs.isNotEmpty
                                      ? snapshot.data?.docs.first
                                              .get('amount')
                                              .toString() ??
                                          widget.startPrice
                                      : widget.startPrice,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: MyColors.red,
                                    fontSize: 16,
                                  ),
                                );
                            }
                          },
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            cont.selectedBidItem = 1;
                            cont.selectedBidAmount = widget.priceOne;
                            cont.totalPrice =
                                int.parse(controller.currentPrice.value) +
                                    cont.selectedBidAmount;
                            cont.update();
                          },
                          child: AuctionBidItem(
                            content: '${widget.priceOne} JOD',
                            isChosen: controller.selectedBidItem == 1,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cont.selectedBidItem = 2;
                            cont.selectedBidAmount = widget.priceTwo;
                            cont.totalPrice =
                                int.parse(controller.currentPrice.value) +
                                    cont.selectedBidAmount;
                            cont.update();
                          },
                          child: AuctionBidItem(
                            content: '${widget.priceTwo} JOD',
                            isChosen: controller.selectedBidItem == 2,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cont.selectedBidItem = 3;
                            cont.selectedBidAmount = widget.priceThree;
                            cont.totalPrice =
                                int.parse(controller.currentPrice.value) +
                                    cont.selectedBidAmount;
                            cont.update();
                          },
                          child: AuctionBidItem(
                            content: '${widget.priceThree} JOD',
                            isChosen: controller.selectedBidItem == 3,
                          ),
                        ),
                      ],
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
                      child: Center(
                        child: Text(
                          '${controller.totalPrice} JOD',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomSlideButton(
                borderRadius: 25,
                height: 67,
                color: MyColors.primary,
                stateKey: _key,
                text: 'confirm'.tr,
                onSubmitted: () async {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () async {
                      _key.currentState?.reset();
                      await controller.fetchCreateBidData(
                          adId: widget.id.toString(),
                          totalPrice: controller.totalPrice.toString(),
                          context: context);
                    },
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
