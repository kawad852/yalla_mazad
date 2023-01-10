import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../controller/auctions/done_auction_controller.dart';
import '../../../../utils/shared_prefrences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bidding_item.dart';

class DoneAuctionItem extends StatelessWidget {
  final List<String> images;
  final String name;
  final String description;
  final String id;
  const DoneAuctionItem({
    required this.name,
    required this.images,
    required this.description,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DoneAuctionController.find;
    return SingleChildScrollView(
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
                  'done auction'.tr,
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
                  child: GetBuilder<DoneAuctionController>(builder: (value) {
                    return Center(
                      child: InkWell(
                        onTap: () async {
                          if (controller.advertisementDetailsModel?.data
                                  ?.isFavorite ==
                              true) {
                            await controller.fetchDeleteFromFavoritesData(
                              adId: id,
                              context: context,
                            );
                            value.update();
                          } else {
                            await controller.fetchAddToFavoritesData(
                              adId: id,
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
                images.isNotEmpty
                    ? CarouselSlider(
                        items: List.generate(
                          images.length,
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
                                strokeAlign: StrokeAlign.inside,
                              ),
                            ),
                            child: CustomNetworkImage(
                              radius: 20,
                              url: images[index],
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
                images.isNotEmpty
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
                          url: MySharedPreferences.image,
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
                              MySharedPreferences.name,
                              style: const TextStyle(
                                color: MyColors.primary,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '@${MySharedPreferences.userId}',
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
                    name,
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
                      description,
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
                                    .doc('7')
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
                            'auction is over'.tr,
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
                            child: const Center(
                              child: Text(
                                '00:00:00:00',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: MyColors.red,
                                  fontSize: 16,
                                ),
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
            ///TODO: edit doc id
            stream: FirebaseFirestore.instance
                .collection('auctions')
                .doc('7')
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  return SizedBox(
                    height: 600,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        bottom: 140,
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
        ],
      ),
    );
  }
}
