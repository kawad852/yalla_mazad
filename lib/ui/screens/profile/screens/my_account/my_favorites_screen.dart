import 'package:flutter/material.dart';

import 'package:yalla_mazad/controller/profile/my_account/my_favorites_controller.dart';
import 'package:yalla_mazad/model/my_favorites/my_favorites_model.dart';

import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../../../binding/auctions/coming_auction_binding.dart';
import '../../../../../binding/auctions/current_auction_binding.dart';
import '../../../../../binding/auctions/done_auction_binding.dart';
import '../../../../widgets/failure_widget.dart';
import '../../../auctions/screens/coming_auction.dart';
import '../../../auctions/screens/current_auction.dart';
import '../../../auctions/screens/done_auction.dart';
import '../../widgets/my_auction_item.dart';
import 'package:get/get.dart';

class MyFavoritesScreen extends StatefulWidget {
  const MyFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<MyFavoritesScreen> createState() => _MyFavoritesScreenState();
}

class _MyFavoritesScreenState extends State<MyFavoritesScreen> {
  @override
  initState() {
    super.initState();
    Get.put(MyFavoritesController());
  }

  @override
  Widget build(BuildContext context) {
    final controller = MyFavoritesController.find;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.phoneSize(
          30,
          height: false,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<MyFavoritesModel?>(
            future: controller.initializeMyFavFuture,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                default:
                  if (snapshot.hasData) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      itemCount: controller.myFavoritesModel?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            String startDate = controller
                                    .myFavoritesModel?.data?[index].startDate ??
                                '';
                            String endDate = controller
                                    .myFavoritesModel?.data?[index].endDate ??
                                '';
                            print(startDate);
                            print(endDate);
                            int startDifference = DateTime.parse(startDate)
                                .difference(DateTime.now())
                                .inSeconds;
                            int endDifference = DateTime.now()
                                .difference(DateTime.parse(endDate))
                                .inSeconds;
                            if (startDifference >= 1) {
                              print('coming');
                              Get.to(
                                () => const ComingAuctionScreen(),
                                binding: ComingAuctionBinding(),
                                arguments: controller
                                    .myFavoritesModel?.data?[index].id,
                              );
                            } else if (startDifference <= 0 &&
                                endDifference <= 0) {
                              print('current');
                              Get.to(
                                () => const CurrentAuctionScreen(),
                                binding: CurrentAuctionBinding(),
                                arguments: controller
                                    .myFavoritesModel?.data?[index].id,
                              );
                            } else if (endDifference >= 1) {
                              print('done');
                              Get.to(
                                () => const DoneAuctionScreen(),
                                binding: DoneAuctionBinding(),
                                arguments: controller
                                    .myFavoritesModel?.data?[index].id,
                              );
                            }
                          },
                          child: MyAuctionItem(
                            image:
                                controller.myFavoritesModel?.data?[index].image,
                            name:
                                controller.myFavoritesModel?.data?[index].name,
                            details: controller
                                .myFavoritesModel?.data?[index].content,
                            price: controller
                                .myFavoritesModel?.data?[index].startPrice
                                .toString(),
                            status: controller
                                .myFavoritesModel?.data?[index].status,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const FailureWidget();
                  } else {
                    return const FailureWidget();
                  }
              }
            },
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
