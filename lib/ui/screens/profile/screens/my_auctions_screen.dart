import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/my_auctions_controller.dart';
import 'package:yalla_mazad/model/my_advertisements/my_advertisements_model.dart';
import 'package:yalla_mazad/ui/screens/profile/widgets/my_auction_item.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../widgets/failure_widget.dart';

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
      child: FutureBuilder<MyAdvertisementsModel?>(
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
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    itemCount:
                        controller.myAdvertisementsModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return MyAuctionItem(
                        image: controller
                            .myAdvertisementsModel?.data?[index].image,
                        name:
                            controller.myAdvertisementsModel?.data?[index].name,
                        details: controller
                            .myAdvertisementsModel?.data?[index].content,
                        price: controller
                            .myAdvertisementsModel?.data?[index].startPrice
                            .toString(),
                        status: controller
                            .myAdvertisementsModel?.data?[index].status,
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
          }),
    );
  }
}
