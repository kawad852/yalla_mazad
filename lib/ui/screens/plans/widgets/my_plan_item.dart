import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/utils/colors.dart';

import '../../../../controller/profile/my_subscription_controller.dart';
import '../../../../utils/images.dart';

class MyPlanItem extends StatelessWidget {
  final String? endDate;
  final String? pointOne;
  final String? pointTwo;
  final String? pointThree;

  const MyPlanItem(
      {required this.endDate,
      required this.pointOne,
      required this.pointTwo,
      required this.pointThree,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = DateTime.tryParse(endDate ?? '');
    final days = -1 * DateTime.now().difference(dateTime!).inDays;
    log(endDate!);

    return Container(
      height: 342,
      width: MediaQuery.of(context).size.width - 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25,
        ),
        color: MyColors.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'current subscription'.tr,
                    style: const TextStyle(
                      color: MyColors.red,
                      fontSize: 20,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            MyImages.justice,
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            pointOne!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            MyImages.justice,
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            pointTwo!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            MyImages.justice,
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            pointThree!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        days.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                      Text(
                        'day left'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
