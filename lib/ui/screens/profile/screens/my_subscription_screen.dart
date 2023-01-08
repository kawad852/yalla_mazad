import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/my_subscription_controller.dart';
import 'package:yalla_mazad/ui/screens/plans/widgets/plan_item.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../widgets/failure_widget.dart';
import '../../plans/widgets/my_plan_item.dart';

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
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
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
                                  final data = snapshot.data?.data;
                                  final length =
                                      snapshot.data?.data?.length ?? 0;
                                  return MyPlanItem(
                                    endDate: data?[length - 1].endDate,
                                    pointOne: data?[length - 1].plan?.pointOne,
                                    pointTwo: data?[length - 1].plan?.pointTwo,
                                    pointThree:
                                        data?[length - 1].plan?.pointThree,
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
                        },
                      ),
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
                                  final data = snapshot.data?.data;
                                  return CarouselSlider(
                                    items: List.generate(
                                      snapshot.data?.data?.length ?? 0,
                                      (index) => Opacity(
                                        opacity: controller.pageIndex == index
                                            ? 1
                                            : 0.5,
                                        child: PlanItem(
                                          price: data?[index].price,
                                          pointOne: data?[index].pointOne,
                                          pointTwo: data?[index].pointTwo,
                                          pointThree: data?[index].pointThree,
                                          time: data?[index].time,
                                          planId: data?[index].id.toString(),
                                          function: controller
                                              .fetchCreateSubscriptionData,
                                        ),
                                      ),
                                    ),
                                    options: CarouselOptions(
                                      onPageChanged: (index, x) {
                                        setState(
                                          () {
                                            controller.pageIndex = index;
                                          },
                                        );
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
