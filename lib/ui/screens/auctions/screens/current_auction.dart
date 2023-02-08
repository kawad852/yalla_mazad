import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/auctions/current_auction_controller.dart';
import 'package:yalla_mazad/model/advertisement_details/advertisement_details_model.dart';
import 'package:yalla_mazad/ui/screens/auctions/widgets/confirm_auction_dialog.dart';
import 'package:yalla_mazad/ui/screens/auctions/widgets/current_auction_item.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../widgets/failure_widget.dart';

class CurrentAuctionScreen extends StatefulWidget {
  const CurrentAuctionScreen({Key? key}) : super(key: key);

  @override
  State<CurrentAuctionScreen> createState() => _CurrentAuctionScreenState();
}

class _CurrentAuctionScreenState extends State<CurrentAuctionScreen> {
  final controller = CurrentAuctionController.find;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AdvertisementDetailsModel?>(
      future: controller.initializeAdvertisementFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Scaffold(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              List<String> images = [];
              for (var item in snapshot.data!.data!.images!) {
                images.add(item.image ?? '');
              }
              return Scaffold(
                extendBodyBehindAppBar: true,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: InkWell(
                  onTap: () {
                    var data = snapshot.data?.data;
                    Get.dialog(
                      ConfirmAuctionDialog(
                        id: data?.id ?? 0,
                        priceOne: data?.priceOne ?? 0,
                        priceTwo: data?.priceTwo ?? 0,
                        priceThree: data?.priceThree ?? 0,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.primary,
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    height: 67,
                    child: Center(
                      child: Text(
                        'submit a bid'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
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
                    CurrentAuctionItem(
                      images: images,
                      name: snapshot.data?.data?.name ?? '',
                      description: snapshot.data?.data?.content ?? '',
                      id: snapshot.data?.data?.id.toString() ?? '0',
                      startDate: snapshot.data?.data?.startDate ?? '',
                      endDate: snapshot.data?.data?.endDate ?? '',
                      userId: snapshot.data?.data?.user?.id.toString() ?? '',
                      userName: snapshot.data?.data?.user?.name ?? '',
                      userProfileImage: snapshot.data?.data?.user?.image ?? '',
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Scaffold(
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
                    Column(
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
                                color: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                          child: FailureWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Scaffold(
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
                    Column(
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
                                color: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                          child: FailureWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
