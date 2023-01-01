import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/my_subscription_controller.dart';
import 'package:yalla_mazad/ui/screens/plans/widgets/plan_item.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../widgets/failure_widget.dart';

class MySubscriptionScreen extends StatefulWidget {
  const MySubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<MySubscriptionScreen> createState() => _MySubscriptionScreenState();
}

class _MySubscriptionScreenState extends State<MySubscriptionScreen> {
  final controller = MySubscriptionController.find;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: controller.initializeMySubscriptionFuture,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.done:
                              default:
                                if (snapshot.hasData) {
                                  if (snapshot.data!.data!.isNotEmpty) {
                                    return PlanItem(
                                      price:
                                          snapshot.data?.data?[0].plan?.price,
                                      name: snapshot.data?.data?[0].plan?.name,
                                      details:
                                          snapshot.data?.data?[0].plan?.details,
                                      numberOfAuctions: snapshot
                                          .data?.data?[0].plan?.numberOfAuction,
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                } else if (snapshot.hasError) {
                                  return const FailureWidget();
                                } else {
                                  return const FailureWidget();
                                }
                            }
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
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
                              'subscriptions'.tr,
                              style: const TextStyle(
                                color: MyColors.primary,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FutureBuilder(
                          future: controller.initializePlansFuture,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.done:
                              default:
                                if (snapshot.hasData) {
                                  return CarouselSlider(
                                    items: List.generate(
                                        snapshot.data?.data?.length ?? 0,
                                        (index) => Opacity(
                                            opacity:
                                                controller.pageIndex == index
                                                    ? 1
                                                    : 0.5,
                                            child: PlanItem(
                                              price: snapshot
                                                  .data?.data?[index].price,
                                              name: snapshot
                                                  .data?.data?[index].name,
                                              details: snapshot
                                                  .data?.data?[index].details,
                                              numberOfAuctions: snapshot
                                                  .data
                                                  ?.data?[index]
                                                  .numberOfAuction,
                                            ))),
                                    options: CarouselOptions(
                                      onPageChanged: (index, x) {
                                        setState(() {
                                          controller.pageIndex = index;
                                        });
                                      },
                                      //aspectRatio: 3/3,
                                      enableInfiniteScroll: false,
                                      height: 392,
                                      viewportFraction: 0.8,
                                      enlargeCenterPage: true,
                                      initialPage: 0,
                                      autoPlay: false,
                                      enlargeFactor: 0.2,
                                      autoPlayInterval: const Duration(
                                        milliseconds: 1000,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return const FailureWidget();
                                } else {
                                  return const FailureWidget();
                                }
                            }
                          }),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
