import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:yalla_mazad/controller/add_auction/add_auction_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_category_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/screen_size.dart';
import '../../../widgets/custom_slide_button.dart';
import '../widgets/added_auction_dialog.dart';

class AddAuctionScreen extends StatelessWidget {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  AddAuctionScreen({Key? key}) : super(key: key);

  final controller = AddAuctionController.find;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            right: -100,
            top: -50,
            child: Align(
              alignment: Alignment.topRight,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    MyImages.circleBackground,
                    width: 300,
                    height: 350,
                    color: const Color(0xffDF3264).withOpacity(
                      0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xffD3CFDC,
                      ),
                      borderRadius: BorderRadius.circular(
                        7,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: MyColors.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'add auction'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
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
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'choose the advertisement section'.tr,
                        style: const TextStyle(
                          color: MyColors.primary,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return const CustomCategoryItem();
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _getAddressTextField(),
                              const SizedBox(
                                height: 10,
                              ),
                              _getDescriptionTextField(),
                              const SizedBox(
                                height: 10,
                              ),
                              _getMainPictureTextField(),
                              const SizedBox(
                                height: 10,
                              ),
                              _getMorePicturesTextField(),
                              const SizedBox(
                                height: 10,
                              ),
                              _getAuctionStartingPriceTextField(),
                              const SizedBox(
                                height: 10,
                              ),
                              _getDirectSellPriceTextField(),
                              const SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
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
                  text: 'send advertisement'.tr,
                  onSubmitted: () {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        _key.currentState?.reset();
                       Get.dialog(AddedAuctionDialog());
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getAddressTextField() {
    return CustomTextField(
      controller: controller.addressController,
      color: MyColors.textFieldColor,
      hint: 'address'.tr,
    );
  }

  _getDescriptionTextField() {
    return CustomTextField(
      controller: controller.descriptionController,
      color: MyColors.textFieldColor,
      maxLines: 10,
      hint: 'description'.tr,
    );
  }

  _getMainPictureTextField() {
    return CustomTextField(
      controller: controller.mainPictureController,
      color: MyColors.textFieldColor,
      hint: 'main picture'.tr,
    );
  }

  _getMorePicturesTextField() {
    return CustomTextField(
      controller: controller.morePicturesController,
      color: MyColors.textFieldColor,
      hint: 'more pictures'.tr,
    );
  }

  _getAuctionStartingPriceTextField() {
    return CustomTextField(
      controller: controller.auctionStartingPriceController,
      color: MyColors.textFieldColor,
      hint: 'auction starting price'.tr,
    );
  }

  _getDirectSellPriceTextField() {
    return CustomTextField(
      controller: controller.directSellPriceController,
      color: MyColors.textFieldColor,
      hint: 'direct sell price'.tr,
    );
  }
}