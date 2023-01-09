import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yalla_mazad/binding/notifications/notifications_binding.dart';
import 'package:yalla_mazad/controller/home/auctions/auctions_by_category_controller.dart';
import 'package:yalla_mazad/controller/home/home/home_controller.dart';
import 'package:yalla_mazad/model/all_advertisements/all_advertiements_model.dart';
import 'package:yalla_mazad/ui/screens/home/auctions/widgets/all_auctions_item.dart';
import 'package:yalla_mazad/ui/screens/notifications/screens/notifications_screen.dart';
import 'package:yalla_mazad/utils/app_constants.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../../../../binding/auctions/coming_auction_binding.dart';
import '../../../../../../binding/auctions/current_auction_binding.dart';
import '../../../../../../binding/auctions/done_auction_binding.dart';
import '../../../../../../controller/home/custom_navigation_bar_controller.dart';
import '../../../../../../controller/home/trending/trending_auction_controller.dart';
import '../../../../../../model/advertisement_by_category/advertisement_by_category_model.dart';
import '../../../../../widgets/failure_widget.dart';
import '../../../../auctions/screens/coming_auction.dart';
import '../../../../auctions/screens/current_auction.dart';
import '../../../../auctions/screens/done_auction.dart';
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
                        HomeController.find.category.key,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder<AdvertisementByCategoryModel?>(
                        future: controller.initializeAdsByCategoryFuture,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const SizedBox(
                                height: 200,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            case ConnectionState.done:
                            default:
                              if (snapshot.hasData) {
                                return snapshot.data!.data!.isNotEmpty
                                    ? SizedBox(
                                        height: 287,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 35.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                              child: ListView.separated(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Get.back();

                                                      ///TODO: find a way for the change in index
                                                      HomeController.find
                                                              .selectedIndex =
                                                          index;
                                                      CustomNavigationBarController
                                                          .find.tabController
                                                          .jumpToTab(3);
                                                      Future.delayed(
                                                          const Duration(
                                                              seconds: 2), () {
                                                        TrendingAuctionController
                                                            .find.pageController
                                                            .jumpToPage(
                                                                HomeController
                                                                    .find
                                                                    .selectedIndex);
                                                      });
                                                    },
                                                    child: AuctionItem(
                                                      image: snapshot.data
                                                          ?.data?[index].image,
                                                      name: snapshot.data
                                                          ?.data?[index].name,
                                                      user: snapshot
                                                          .data
                                                          ?.data?[index]
                                                          .user
                                                          ?.name,
                                                      price:
                                                          '${snapshot.data?.data?[index].startPrice.toString()} JOD',
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const SizedBox(
                                                    width: 10,
                                                  );
                                                },
                                                itemCount: snapshot
                                                        .data?.data?.length ??
                                                    0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox();
                              } else if (snapshot.hasError) {
                                return const FailureWidget();
                              } else {
                                return const FailureWidget();
                              }
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35.0,
                      ),
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
                    PagedListView<int, AllAdsList>.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsetsDirectional.only(
                        start: 30,
                        top: 20,
                      ),
                      scrollDirection: Axis.vertical,
                      pagingController: controller.allAdsPagingController,
                      builderDelegate: PagedChildBuilderDelegate<AllAdsList>(
                        firstPageErrorIndicatorBuilder: (context) => Center(
                          child: Text(
                            AppConstants.failedMessage,
                          ),
                        ),
                        newPageProgressIndicatorBuilder: (context) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                        itemBuilder: (context, data, index) {
                          return InkWell(
                            onTap: () {
                              String startDate = data.startDate ?? '';
                              String endDate = data.endDate ?? '';
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
                                  arguments: data.id,
                                );
                              } else if (startDifference <= 0 &&
                                  endDifference <= 0) {
                                log('current');
                                Get.to(
                                  () => const CurrentAuctionScreen(),
                                  binding: CurrentAuctionBinding(),
                                  arguments: data.id,
                                );
                              } else if (endDifference >= 1) {
                                log('done');
                                Get.to(
                                  () => const DoneAuctionScreen(),
                                  binding: DoneAuctionBinding(),
                                  arguments: data.id,
                                );
                              }
                            },
                            child: AllAuctionsItem(
                              image: data.image,
                              name: data.name,
                              price: '${data.startPrice.toString()} JOD',
                              details: data.content,
                              userImage: data.user?.image,
                              userName: data.user?.name,
                            ),
                          );
                        },
                      ),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                    // FutureBuilder<AllAdvertisementsModel?>(
                    //   future: controller.initializeAllAdsFuture,
                    //   builder: (context, snapshot) {
                    //     switch (snapshot.connectionState) {
                    //       case ConnectionState.waiting:
                    //         return const Center(
                    //             child: CircularProgressIndicator());
                    //       case ConnectionState.done:
                    //       default:
                    //         if (snapshot.hasData) {
                    //           return Column(
                    //             children: [
                    //               ListView.separated(
                    //                 shrinkWrap: true,
                    //                 physics:
                    //                     const NeverScrollableScrollPhysics(),
                    //                 padding: const EdgeInsetsDirectional.only(
                    //                   start: 30,
                    //                   top: 20,
                    //                 ),
                    //                 scrollDirection: Axis.vertical,
                    //                 itemBuilder: (context, index) {
                    //                   return AllAuctionsItem(
                    //                     image:
                    //                         snapshot.data?.data?[index].image,
                    //                     name: snapshot.data?.data?[index].name,
                    //                     price:
                    //                         '${snapshot.data?.data?[index].startPrice.toString()} JOD',
                    //                     details:
                    //                         snapshot.data?.data?[index].content,
                    //                     userImage: snapshot
                    //                         .data?.data?[index].user?.image,
                    //                     userName: snapshot
                    //                         .data?.data?[index].user?.name,
                    //                   );
                    //                 },
                    //                 separatorBuilder: (context, index) {
                    //                   return const SizedBox(
                    //                     height: 10,
                    //                   );
                    //                 },
                    //                 itemCount: snapshot.data?.data?.length ?? 0,
                    //               ),
                    //               const SizedBox(
                    //                 height: 30,
                    //               ),
                    //             ],
                    //           );
                    //         } else if (snapshot.hasError) {
                    //           return const FailureWidget();
                    //         } else {
                    //           return const FailureWidget();
                    //         }
                    //     }
                    //   },
                    // ),
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
