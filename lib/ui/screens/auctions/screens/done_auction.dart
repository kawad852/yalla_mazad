import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/auctions/done_auction_controller.dart';
import 'package:yalla_mazad/model/advertisement_details/advertisement_details_model.dart';
import 'package:yalla_mazad/ui/screens/auctions/widgets/done_auction_item.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../widgets/failure_widget.dart';

class DoneAuctionScreen extends StatefulWidget {
  const DoneAuctionScreen({Key? key}) : super(key: key);

  @override
  State<DoneAuctionScreen> createState() => _DoneAuctionScreenState();
}

class _DoneAuctionScreenState extends State<DoneAuctionScreen> {
  final controller = DoneAuctionController.find;

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
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            );
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              List<String> images = [snapshot.data?.data?.image ?? ''];
              for (var item in snapshot.data!.data!.images!) {
                images.add(item.image ?? '');
              }
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
                    DoneAuctionItem(
                      images: images,
                      name: snapshot.data?.data?.name ?? '',
                      description: snapshot.data?.data?.content ?? '',
                      id: snapshot.data?.data?.id.toString() ?? '0',
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
                    const FailureWidget(),
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
                    const FailureWidget(),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
