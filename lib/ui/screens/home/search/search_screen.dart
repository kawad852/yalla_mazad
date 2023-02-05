import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yalla_mazad/controller/home/search/search_controller.dart';
import 'package:yalla_mazad/model/search_advertisement/search_advertisement_model.dart';
import 'package:yalla_mazad/ui/screens/home/auctions/widgets/all_auctions_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';

import '../../../../binding/auctions/coming_auction_binding.dart';
import '../../../../binding/auctions/current_auction_binding.dart';
import '../../../../binding/auctions/done_auction_binding.dart';
import '../../../../binding/notifications/notifications_binding.dart';
import '../../../../controller/home/custom_navigation_bar_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../auctions/screens/coming_auction.dart';
import '../../auctions/screens/current_auction.dart';
import '../../auctions/screens/done_auction.dart';
import '../../notifications/screens/notifications_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    Get.put(SearchController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = SearchController.find;
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
                    color: MyColors.textFieldColor,
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
                              CustomNavigationBarController.find.tabController
                                  .jumpToTab(0);
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
                        'search'.tr,
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
                              width: 25,
                              height: 25,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      child: CustomTextField(
                        controller: controller.searchController,
                        color: MyColors.primary5D0,
                        hint: 'what do you want to search for?'.tr,
                        suffixIcon: const Icon(
                          Icons.search_sharp,
                          color: MyColors.primary,
                          size: 30,
                        ),
                        onChanged: (value) {
                          if (controller.searchQuery.value != value) {
                            controller.onSearchChanged(value);
                          }
                        },
                      ),
                    ),
                    PagedListView<int, SearchedAdList>.separated(
                      padding: const EdgeInsetsDirectional.only(
                        start: 30,
                        top: 20,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      pagingController: controller.searchPagingController,
                      builderDelegate:
                          PagedChildBuilderDelegate<SearchedAdList>(
                              noItemsFoundIndicatorBuilder: (context) {
                        return SizedBox(
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 30,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  MyImages.noSearchResults,
                                  height: 320,
                                ),
                                Text(
                                  'unfortunately, no search results are currently available'
                                      .tr,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(
                                      0xff333333,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }, itemBuilder: (context, data, index) {
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
                            details: data.content,
                            id: data.id,
                            userImage: data.user?.image,
                            userName: data.user?.name,
                            startDate: data.startDate,
                            endDate: data.endDate,
                          ),
                        );
                      }),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 90,
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
