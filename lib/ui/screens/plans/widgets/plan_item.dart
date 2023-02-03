import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
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
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: Colors.white,
                            height: 200,
                            child: Column(
                              children: [
                                ApplePayButton(
                                  paymentConfigurationAsset:
                                      'default_payment_profile_apple_pay.json',
                                  paymentItems: [
                                    PaymentItem(
                                      label: 'Total',
                                      amount: price.toString(),
                                      status: PaymentItemStatus.final_price,
                                    )
                                  ],
                                  style: ApplePayButtonStyle.black,
                                  type: ApplePayButtonType.buy,
                                  margin: const EdgeInsets.only(top: 15.0),
                                  onPaymentResult: onApplePayResult,
                                  loadingIndicator: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                GooglePayButton(
                                  childOnError: Text('error'),
                                  onError: (value){

                                  },
                                  paymentConfigurationAsset:
                                      'default_payment_profile_google_pay.json',
                                  paymentItems: [
                                    PaymentItem(
                                      label: 'Total',
                                      amount: price.toString(),
                                      status: PaymentItemStatus.final_price,
                                    )
                                  ],
                                  type: GooglePayButtonType.pay,
                                  margin: const EdgeInsets.only(top: 15.0),
                                  onPaymentResult: onGooglePayResult,
                                  loadingIndicator: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
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

  void onApplePayResult(paymentResult) async {
    // Send the resulting Apple Pay token to your server / PSP
    await function(
      planId: planId,
      time: time,
      context: Get.context,
    );
  }

  void onGooglePayResult(paymentResult) async {
    // Send the resulting Google Pay token to your server / PSP
    await function(
      planId: planId,
      time: time,
      context: Get.context,
    );
  }
}
