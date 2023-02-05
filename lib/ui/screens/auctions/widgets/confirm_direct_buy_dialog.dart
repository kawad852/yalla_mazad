import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/screen_size.dart';
import '../../../widgets/custom_slide_button.dart';

class ConfirmDirectBuyDialog extends StatelessWidget {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  final String buyNowPrice;

  ConfirmDirectBuyDialog({
    Key? key,
    required this.buyNowPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: ScreenSize.phoneSize(
          354,
          height: false,
        ),
        height: ScreenSize.phoneSize(
          415,
          height: false,
        ),
        padding: const EdgeInsets.only(
          top: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: MyColors.red,
                    ),
                  ),
                  Text(
                    'direct sell'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      color: MyColors.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: Column(
                children: [
                  Text(
                    'direct sell price'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    width: 133,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: MyColors.textFieldColor,
                    ),
                    child: Center(
                      child: Text(
                        buyNowPrice,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: MyColors.red,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                'Do you want to buy the product directly without accessing the auction? Upon confirmation of the order, the Yalla Mazad team will contact you directly'
                    .tr,
                style: const TextStyle(
                  color: MyColors.primary,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            CustomSlideButton(
              borderRadius: 25,
              height: 67,
              color: MyColors.red,
              stateKey: _key,
              text: 'confirm'.tr,
              onSubmitted: () {
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    _key.currentState?.reset();

                    ///TODO: edit
                    Get.back();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
