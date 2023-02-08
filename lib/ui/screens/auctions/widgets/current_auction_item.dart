import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/auctions/done_auction_binding.dart';
import 'package:yalla_mazad/ui/screens/auctions/screens/done_auction.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../controller/auctions/current_auction_controller.dart';
import '../../../widgets/custom_countdown_timer.dart';
import 'bidding_item.dart';

class CurrentAuctionItem extends StatefulWidget {
  final List<String> images;
  final String name;
  final String description;
  final String id;
  final String startDate;
  final String endDate;
  final String userName;
  final String userId;
  final String userProfileImage;

  const CurrentAuctionItem({
    required this.name,
    required this.images,
    required this.description,
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.userId,
    required this.userName,
    required this.userProfileImage,
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentAuctionItem> createState() => _CurrentAuctionItemState();
}

class _CurrentAuctionItemState extends State<CurrentAuctionItem> {
  var seconds = 0;

  ///0 means coming, 1 current, 2 done
  RxInt status = 0.obs;
  var secondsToStart = 0;

  @override
  void initState() {
    secondsToStart =
        DateTime.parse(widget.startDate).difference(DateTime.now()).inSeconds;
    seconds =
        DateTime.parse(widget.endDate).difference(DateTime.now()).inSeconds;
    if (secondsToStart > 0) {
      status.value = 0;
      RxInt remaining = secondsToStart.obs;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (remaining.value == 0) {
          timer.cancel();
          status.value = 1;
          log('timer for coming is done and status is: ${status.value}');
        } else {
          remaining.value--;
          log('timer for coming is moving and remaining is is: $remaining');
        }
        setState(() {});
      });
    } else if (seconds == 0) {
      status.value = 2;
    } else if (secondsToStart <= 0 && seconds > 0) {
      status.value = 1;
    }
    log('seconds: $seconds');
    log('secondsToStart: $secondsToStart');
    log('status: ${status.value}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = CurrentAuctionController.find;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            primary: true,
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
                      Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsetsDirectional.only(
                          start: 3,
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
                              Get.back();
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
                        'current auction'.tr,
                        style: const TextStyle(
                          color: MyColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
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
                        child: GetBuilder<CurrentAuctionController>(builder: (value) {
                          return Center(
                            child: InkWell(
                              onTap: () async {
                                if (controller.advertisementDetailsModel?.data
                                        ?.isFavorite ==
                                    true) {
                                  await controller.fetchDeleteFromFavoritesData(
                                    adId: widget.id,
                                    context: context,
                                  );
                                  value.update();
                                } else {
                                  await controller.fetchAddToFavoritesData(
                                    adId: widget.id,
                                    context: context,
                                  );
                                  value.update();
                                }
                              },
                              child: controller
                                      .advertisementDetailsModel!.data!.isFavorite!
                                  ? SvgPicture.asset(
                                      MyImages.heartFilled,
                                      width: 20,
                                      height: 20,
                                    )
                                  : Image.asset(
                                      MyImages.favorite,
                                      width: 20,
                                      height: 20,
                                    ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 620,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      widget.images.isNotEmpty
                          ? CarouselSlider(
                              items: List.generate(
                                widget.images.length,
                                (index) => Container(
                                  height: 333,
                                  width: ScreenSize.phoneSize(
                                    346,
                                    height: false,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      25,
                                    ),
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                        228,
                                        225,
                                        232,
                                        1,
                                      ),
                                      width: 4,
                                      strokeAlign: BorderSide.strokeAlignInside,
                                    ),
                                  ),
                                  child: CustomNetworkImage(
                                    radius: 20,
                                    url: widget.images[index],
                                    defaultUrl: MyImages.logo,
                                  ),
                                ),
                              ),
                              options: CarouselOptions(
                                height: 333,
                                viewportFraction: 0.8,
                                enlargeCenterPage: true,
                                initialPage: 0,
                                autoPlay: false,
                                enlargeFactor: 0.3,
                                enableInfiniteScroll: false,
                              ),
                            )
                          : const SizedBox(),
                      widget.images.isNotEmpty
                          ? const SizedBox(
                              height: 50,
                            )
                          : const SizedBox(),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xffD3CFDC,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                    0xffD3CFDC,
                                  ),
                                  width: 4,
                                ),
                              ),
                              child: CustomNetworkImage(
                                url: widget.userProfileImage,
                                defaultUrl: MyImages.noProfile,
                                radius: 100,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: ScreenSize.phoneSize(
                                170,
                                height: false,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    widget.userName,
                                    style: const TextStyle(
                                      color: MyColors.primary,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '@${widget.userId}',
                                    textDirection: TextDirection.ltr,
                                    style: const TextStyle(
                                      color: MyColors.greyPrimary,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 50,
                        ),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 50,
                          ),
                          child: Text(
                            widget.description,
                            style: const TextStyle(
                              color: Color(
                                0xff333333,
                              ),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'highest price'.tr,
                                  style: const TextStyle(
                                    color: MyColors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: ScreenSize.phoneSize(
                                    133,
                                    height: false,
                                  ),
                                  height: ScreenSize.phoneSize(
                                    28,
                                    height: false,
                                  ),
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
                                          .doc(widget.id)
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
                                            return Text(
                                              snapshot.data!.docs.isNotEmpty
                                                  ? snapshot.data?.docs.first
                                                          .get('amount')
                                                          .toString() ??
                                                      ""
                                                  : " ",
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
                            Column(
                              children: [
                                Text(
                                  'time left'.tr,
                                  style: const TextStyle(
                                    color: MyColors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: ScreenSize.phoneSize(
                                    133,
                                    height: false,
                                  ),
                                  height: ScreenSize.phoneSize(
                                    28,
                                    height: false,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                    color: MyColors.textFieldColor,
                                  ),
                                  child: Center(
                                    child: CountDownTimer(
                                      secondsRemaining: seconds,
                                      whenTimeExpires: () {
                                        setState(
                                          () {
                                            status.value = 2;
                                          },
                                        );
                                        log('timer for current is done and status is: ${status.value}');
                                        Get.off(
                                          const DoneAuctionScreen(),
                                          binding: DoneAuctionBinding(),
                                          arguments: widget.id,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('auctions')
                      .doc(widget.id)
                      .collection('biddings')
                      .orderBy('amount', descending: true)
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        'an error occured'.tr,
                      );
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      default:
                        return SizedBox(
                          height: snapshot.data!.docs.length * 70,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                             // bottom: 140,
                            ),
                            children: snapshot.data!.docs
                                .asMap()
                                .map(
                                  (key, value) => MapEntry(
                                    key,
                                    BiddingItem(
                                      name: value['name'] ?? "",
                                      image: value['image'] ?? "",
                                      amount: (value['amount']).toString(),
                                      order: (key + 1),
                                      isLast: key + 1 == snapshot.data!.docs.length,
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                        );
                    }
                  },
                ),
                const SizedBox(height: 200,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
