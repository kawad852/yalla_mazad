import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/my_subscription_controller.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../subscriptions/widgets/subscription_item.dart';

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
        // const SizedBox(
        //   height: 10,
        // ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      const SubscriptionItem(),
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
                      CarouselSlider(
                        ///TODO: from api
                        items: List.generate(
                            3,
                            (index) => Opacity(
                                opacity:
                                    controller.pageIndex == index ? 1 : 0.5,
                                child: const SubscriptionItem())),
                        options: CarouselOptions(
                          onPageChanged: (index, x) {
                            setState(() {
                              controller.pageIndex = index;
                            });
                          },
                          //aspectRatio: 3/3,
                          height: 400,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                          initialPage: 0,
                          autoPlay: false,
                          enlargeFactor: 0.2,
                          autoPlayInterval: const Duration(
                            milliseconds: 1000,
                          ),
                        ),
                      ),
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
