import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/utils/colors.dart';
import '../../../../utils/images.dart';

class PlanItem extends StatelessWidget {
  final String? price;
  final String? pointOne;
  final String? pointTwo;
  final String? pointThree;
  final String? planId;
  final int? time;
  final Function function;

  const PlanItem(
      {required this.price,
      required this.pointOne,
      required this.pointTwo,
      required this.pointThree,
      required this.planId,
      required this.time,
      required this.function,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 392,
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
                  ///TODO:the order of subscription
                  const Text(
                    'الاشتراك الاول',
                    style: TextStyle(
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
                        price.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                      const Text(
                        'دينار اردني',
                        style: TextStyle(
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
          planId != null
              ? InkWell(
                  onTap: () async {
                    await function(
                        planId: planId, time: time, context: context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: MyColors.red,
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'subscribe now'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
