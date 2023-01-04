import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/my_account/my_auctions_controller.dart';
import 'package:yalla_mazad/model/my_advertisements/my_advertisements_model.dart';
import 'package:yalla_mazad/ui/screens/profile/widgets/my_auction_item.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../../../binding/auctions/coming_auction_binding.dart';
import '../../../../../binding/auctions/current_auction_binding.dart';
import '../../../../../binding/auctions/done_auction_binding.dart';
import '../../../../widgets/failure_widget.dart';
import '../../../auctions/screens/coming_auction.dart';
import '../../../auctions/screens/current_auction.dart';
import '../../../auctions/screens/done_auction.dart';

class MyAuctionsScreen extends StatefulWidget {
  const MyAuctionsScreen({Key? key}) : super(key: key);

  @override
  State<MyAuctionsScreen> createState() => _MyAuctionsScreenState();
}

class _MyAuctionsScreenState extends State<MyAuctionsScreen> {
  @override
  void initState() {
    Get.put(MyAuctionsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = MyAuctionsController.find;
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
          FutureBuilder<MyAdvertisementsModel?>(
            future: controller.initializeMyAdsFuture,
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
                      itemCount:
                          controller.myAdvertisementsModel?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            String startDate = controller
                                    .myAdvertisementsModel
                                    ?.data?[index]
                                    .startDate ??
                                '';
                            String endDate = controller.myAdvertisementsModel
                                    ?.data?[index].endDate ??
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
                                    .myAdvertisementsModel?.data?[index].id,
                              );
                            } else if (startDifference <= 0 &&
                                endDifference <= 0) {
                              print('current');
                              Get.to(
                                () => const CurrentAuctionScreen(),
                                binding: CurrentAuctionBinding(),
                                arguments: controller
                                    .myAdvertisementsModel?.data?[index].id,
                              );
                            } else if (endDifference >= 1) {
                              print('done');
                              Get.to(
                                () => const DoneAuctionScreen(),
                                binding: DoneAuctionBinding(),
                                arguments: controller
                                    .myAdvertisementsModel?.data?[index].id,
                              );
                            }
                          },
                          child: MyAuctionItem(
                            image: controller
                                .myAdvertisementsModel?.data?[index].image,
                            name: controller
                                .myAdvertisementsModel?.data?[index].name,
                            details: controller
                                .myAdvertisementsModel?.data?[index].content,
                            price: controller.myAdvertisementsModel
                                ?.data?[index].startPrice
                                .toString(),
                            status: controller
                                .myAdvertisementsModel?.data?[index].status,
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
