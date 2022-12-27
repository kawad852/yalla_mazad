import 'package:flutter/material.dart';

import 'package:yalla_mazad/controller/profile/my_account/my_favorites_controller.dart';
import 'package:yalla_mazad/model/my_favorites/my_favorites_model.dart';

import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../../widgets/failure_widget.dart';
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
      child: FutureBuilder<MyFavoritesModel?>(
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
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          itemCount:
                              controller.myFavoritesModel?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return MyAuctionItem(
                              image: controller
                                  .myFavoritesModel?.data?[index].image,
                              name: controller
                                  .myFavoritesModel?.data?[index].name,
                              details: controller
                                  .myFavoritesModel?.data?[index].content,
                              price: controller
                                  .myFavoritesModel?.data?[index].startPrice
                                  .toString(),
                              status: controller
                                  .myFavoritesModel?.data?[index].status,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
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
