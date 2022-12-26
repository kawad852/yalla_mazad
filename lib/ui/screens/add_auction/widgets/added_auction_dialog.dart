import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:yalla_mazad/controller/home/custom_navigation_bar_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/screen_size.dart';
import '../../../widgets/custom_slide_button.dart';

class AddedAuctionDialog extends StatelessWidget {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  AddedAuctionDialog({Key? key}) : super(key: key);

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
          281,
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
                    'sent'.tr,
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Text(
                'congratulations, your ad has been successfully submitted. The Yalla Mazad team will contact you as soon as possible'
                    .tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(
                    0xff333333,
                  ),
                ),
              ),
            ),
            CustomSlideButton(
              borderRadius: 25,
              height: ScreenSize.phoneSize(
                60,
                height: true,
              ),
              color: MyColors.primary,
              stateKey: _key,
              text: 'my account'.tr,
              onSubmitted: () {
                Future.delayed(
                  const Duration(seconds: 1),
                  () async {
                    _key.currentState?.reset();
                    Get.back();
                    CustomNavigationBarController.find.tabController
                        .jumpToTab(4);
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
