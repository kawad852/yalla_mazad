import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/view_auctions/view_auction_controller.dart';
import 'package:yalla_mazad/ui/screens/home/trending/widgets/trending_auction_item.dart';
import 'package:yalla_mazad/utils/images.dart';

class ViewAuctionScreen extends StatefulWidget {
  const ViewAuctionScreen({Key? key}) : super(key: key);

  @override
  State<ViewAuctionScreen> createState() => _ViewAuctionScreenState();
}

class _ViewAuctionScreenState extends State<ViewAuctionScreen> {
  @override
  void initState() {
    Get.put(ViewAuctionController());
    controller = ViewAuctionController.find;
    super.initState();
  }

  late final ViewAuctionController controller;

  @override
  void dispose() {
    Get.delete<ViewAuctionController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   primary: false,
      //   toolbarHeight: 35,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     'trending auctions'.tr,
      //     style: const TextStyle(
      //       color: MyColors.primary,
      //       fontSize: 18,
      //     ),
      //   ),
      //   leadingWidth: 72,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Get.back();
      //     },
      //     child: Container(
      //       width: 35,
      //       height: 35,
      //       padding: const EdgeInsetsDirectional.only(
      //         start: 3,
      //       ),
      //       margin: const EdgeInsetsDirectional.only(
      //         start: 37,
      //       ),
      //       decoration: BoxDecoration(
      //         color: const Color(
      //           0xffD3CFDC,
      //         ),
      //         borderRadius: BorderRadius.circular(
      //           7,
      //         ),
      //       ),
      //       child: const Center(
      //         child: Icon(
      //           Icons.arrow_back_ios,
      //           color: MyColors.primary,
      //           size: 15,
      //         ),
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         Get.to(
      //           () => const NotificationsScreen(),
      //           binding: NotificationsBinding(),
      //         );
      //       },
      //       child: Container(
      //         width: 35,
      //         height: 35,
      //         margin: const EdgeInsetsDirectional.only(
      //           end: 37,
      //         ),
      //         decoration: BoxDecoration(
      //           color: const Color.fromRGBO(
      //             202,
      //             195,
      //             212,
      //             0.3,
      //           ),
      //           borderRadius: BorderRadius.circular(
      //             7,
      //           ),
      //         ),
      //         child: Center(
      //           child: Image.asset(
      //             MyImages.notification,
      //             width: 20,
      //             height: 20,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
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
          SizedBox(
            width: Get.width,
            child: GetBuilder<ViewAuctionController>(
              builder: (value) {
                final list = controller.popularAdsItems;
                return SizedBox(
                  width: Get.width,
                  child: PageView(
                    controller: value.pageController,
                    children: List.generate(
                      value.popularAdsItems.length,
                      (index) => TrendingAuctionItem(
                        image: list[index].image ?? '',
                        name: list[index].name ?? '',
                        user: list[index].user?.name ?? '',
                        id: list[index].id.toString(),
                        startDate: list[index].startDate ?? '',
                        endDate: list[index].endDate ?? '',
                        priceOne: list[index].priceOne ?? 0,
                        priceTwo: list[index].priceTwo ?? 0,
                        priceThree: list[index].priceThree ?? 0,
                        isBack: true,
                        startPrice: list[index].startPrice?.toString() ?? '0',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // FutureBuilder<PopularAdvertisementModel?>(
          //     future: controller.initializePopularAdsFuture,
          //     builder: (context, snapshot) {
          //       switch (snapshot.connectionState) {
          //         case ConnectionState.waiting:
          //           return const Center(
          //             child: CircularProgressIndicator(),
          //           );
          //         case ConnectionState.done:
          //         default:
          //           if (snapshot.hasData) {
          //             return PageView(
          //               controller: controller.pageController,
          //               children: List.generate(
          //                 snapshot.data?.data?.length ?? 0,
          //                 (index) => TrendingAuctionItem(
          //                   image: snapshot.data?.data?[index].image ?? '',
          //                   name: snapshot.data?.data?[index].name ?? '',
          //                   user: snapshot.data?.data?[index].user?.name ?? '',
          //                   id: snapshot.data?.data?[index].id.toString() ??
          //                       '0',
          //                 ),
          //               ),
          //             );
          //           } else if (snapshot.hasError) {
          //             return const FailureWidget();
          //           } else {
          //             return const FailureWidget();
          //           }
          //       }
          //     }),
        ],
      ),
    );
  }
}
