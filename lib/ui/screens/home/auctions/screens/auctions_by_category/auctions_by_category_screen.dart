import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/auctions_by_category_controller.dart';
import 'package:yalla_mazad/model/all_advertisements/all_advertiements_model.dart';
import 'package:yalla_mazad/ui/screens/home/auctions/widgets/all_auctions_item.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../../../../model/advertisement_by_category/advertisement_by_category_model.dart';
import '../../../../../widgets/failure_widget.dart';
import '../../../home/widgets/auction_item.dart';

class AuctionsByCategoryScreen extends StatefulWidget {
  const AuctionsByCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AuctionsByCategoryScreen> createState() =>
      _AuctionsByCategoryScreenState();
}

class _AuctionsByCategoryScreenState extends State<AuctionsByCategoryScreen> {
  final controller = AuctionsByCategoryController.find;
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
          SingleChildScrollView(
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
                        ///TODO: edit to take category name
                        const Text(
                          'name of category',
                          style: TextStyle(
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_outlined,
                                color: MyColors.primary,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Row(
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
                            'trending auctions'.tr,
                            style: const TextStyle(
                              color: MyColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 247,
                      child: FutureBuilder<AdvertisementByCategoryModel?>(
                          future: controller.initializeAdsByCategoryFuture,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                    child: CircularProgressIndicator());
                              case ConnectionState.done:
                              default:
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return AuctionItem(
                                        image:
                                            snapshot.data?.data?[index].image,
                                        name:
                                            snapshot.data?.data?[index].name,
                                        user: snapshot
                                            .data?.data?[index].user?.name,
                                        price:
                                            '${snapshot.data?.data?[index].startPrice.toString()} JOD',
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        width: 10,
                                      );
                                    },
                                    itemCount:
                                        snapshot.data?.data?.length ?? 0,
                                  );
                                } else if (snapshot.hasError) {
                                  return const FailureWidget();
                                } else {
                                  return const FailureWidget();
                                }
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Row(
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
                            'all auctions'.tr,
                            style: const TextStyle(
                              color: MyColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FutureBuilder<AllAdvertisementsModel?>(
                        future: controller.initializeAllAdsFuture,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                  child: CircularProgressIndicator());
                            case ConnectionState.done:
                            default:
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics:  const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return AllAuctionsItem(
                                          image: snapshot
                                              .data?.data?[index].image,
                                          name: snapshot
                                              .data?.data?[index].name,
                                          price:
                                              '${snapshot.data?.data?[index].startPrice.toString()} JOD',
                                          details: snapshot
                                              .data?.data?[index].content,
                                          status: snapshot
                                              .data?.data?[index].status,
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          height: 10,
                                        );
                                      },
                                      itemCount:
                                          snapshot.data?.data?.length ?? 0,
                                    ),
                                    const SizedBox(height: 30,),
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                return const FailureWidget();
                              } else {
                                return const FailureWidget();
                              }
                          }
                        },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
