import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yalla_mazad/binding/notifications/notifications_binding.dart';
import 'package:yalla_mazad/controller/home/auctions/auctions_by_category_controller.dart';
import 'package:yalla_mazad/controller/home/home/home_controller.dart';
import 'package:yalla_mazad/controller/home/view_auctions/view_auction_controller.dart';
import 'package:yalla_mazad/ui/screens/home/auctions/widgets/all_auctions_item.dart';
import 'package:yalla_mazad/ui/screens/home/view_auctions/screens/view_auction_screen.dart';
import 'package:yalla_mazad/ui/screens/notifications/screens/notifications_screen.dart';
import 'package:yalla_mazad/utils/app_constants.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../../../../binding/auctions/coming_auction_binding.dart';
import '../../../../../../binding/auctions/current_auction_binding.dart';
import '../../../../../../binding/auctions/done_auction_binding.dart';
import '../../../../../../model/advertisement_by_category/advertisement_by_category_model.dart';
import '../../../../../../model/popular_advertisement/popular_advertisement_model.dart';
import '../../../../../../utils/screen_size.dart';
import '../../../../../widgets/custom_shimmer_loading.dart';
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
          SafeArea(
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
                    HomeController.find.category.key,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ),
                leadingWidth: 70,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 35,
                    ),
                    child: Container(
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
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: MyColors.primary,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 35,
                    ),
                    child: Container(
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
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              FutureBuilder<AdvertisementByCategoryModel?>(
                                  future:
                                      controller.initializeAdsByCategoryFuture,
                                  builder: (context, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting:
                                        return SizedBox(
                                          height: 287,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 35.0,
                                                ),
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 30,
                                                  ),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        CustomShimmerLoading(
                                                          radius: 25,
                                                          height: ScreenSize
                                                              .phoneSize(
                                                            180,
                                                            height: false,
                                                          ),
                                                          width: ScreenSize
                                                              .phoneSize(
                                                            180,
                                                            height: false,
                                                          ),
                                                        ),
                                                        const Expanded(
                                                          child: SizedBox(),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return const SizedBox(
                                                      width: 10,
                                                    );
                                                  },
                                                  itemCount: 4,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 35.0,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
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
                                                              'trending auctions'
                                                                  .tr,
                                                              style:
                                                                  const TextStyle(
                                                                color: MyColors
                                                                    .primary,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                        child:
                                                            ListView.separated(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 30,
                                                          ),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return InkWell(
                                                              onTap: () {
                                                                Future.delayed(
                                                                  const Duration(
                                                                    milliseconds:
                                                                        50,
                                                                  ),
                                                                  () {
                                                                    ViewAuctionController
                                                                        .find
                                                                        .pageController
                                                                        .jumpToPage(
                                                                            index);
                                                                  },
                                                                );
                                                                Get.to(
                                                                  () =>
                                                                      const ViewAuctionScreen(),
                                                                  arguments:
                                                                      snapshot
                                                                          .data!
                                                                          .data!,
                                                                );
                                                              },
                                                              child:
                                                                  AuctionItem(
                                                                image: snapshot
                                                                    .data
                                                                    ?.data?[
                                                                        index]
                                                                    .image,
                                                                name: snapshot
                                                                    .data
                                                                    ?.data?[
                                                                        index]
                                                                    .name,
                                                                user: snapshot
                                                                    .data
                                                                    ?.data?[
                                                                        index]
                                                                    .user
                                                                    ?.name,
                                                                id: snapshot
                                                                    .data
                                                                    ?.data?[
                                                                        index]
                                                                    .id,
                                                                startDate: snapshot
                                                                    .data
                                                                    ?.data?[
                                                                        index]
                                                                    .startDate,
                                                                endDate: snapshot
                                                                    .data
                                                                    ?.data?[
                                                                        index]
                                                                    .endDate,
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
                                                                  .data
                                                                  ?.data
                                                                  ?.length ??
                                                              0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : const SizedBox();
                                        } else if (snapshot.hasError) {
                                          return Column(
                                            children: const [
                                              SizedBox(
                                                height: 35,
                                                child: FailureWidget(),
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Column(
                                            children: const [
                                              SizedBox(
                                                height: 35,
                                                child: FailureWidget(),
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                            ],
                                          );
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
                              PagedListView<int, PopularAdsList>.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsetsDirectional.only(
                                  start: 30,
                                  top: 20,
                                ),
                                scrollDirection: Axis.vertical,
                                pagingController:
                                    controller.allAdsPagingController,
                                builderDelegate:
                                    PagedChildBuilderDelegate<PopularAdsList>(
                                  firstPageErrorIndicatorBuilder: (context) =>
                                      Column(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            AppConstants.failedMessage,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                  newPageProgressIndicatorBuilder: (context) =>
                                      const SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  firstPageProgressIndicatorBuilder:
                                      (context) => const SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  itemBuilder: (context, data, index) {
                                    return InkWell(
                                      onTap: () {
                                        String startDate = data.startDate ?? '';
                                        String endDate = data.endDate ?? '';
                                        log(startDate);
                                        log(endDate);
                                        int startDifference =
                                            DateTime.parse(startDate)
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
                                            arguments: [
                                              data.id,
                                              data.priceOne,
                                              data.priceTwo,
                                              data.priceThree
                                            ],
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
                                        id: data.id,
                                        details: data.content,
                                        userImage: data.user?.image,
                                        userName: data.user?.name,
                                        startDate: data.startDate,
                                        endDate: data.endDate,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
