import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/my_subscription_controller.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../subscriptions/widgets/subscription_item.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MySubscriptionController.find;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SubscriptionItem(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
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
                      const SizedBox(
                        height: 30,
                      ),
                      CarouselSlider(
                        items: const [
                          SubscriptionItem(),
                          SubscriptionItem(),
                          SubscriptionItem(),
                        ],
                        options: CarouselOptions(
                          height: 354,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          initialPage: 0,
                          autoPlay: true,
                          enlargeFactor: 0.3,
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
