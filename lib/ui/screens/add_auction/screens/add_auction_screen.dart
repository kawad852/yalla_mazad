import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:yalla_mazad/controller/add_auction/add_auction_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_category_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/ui/widgets/failure_widget.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/screen_size.dart';
import '../../../widgets/custom_slide_button.dart';

class AddAuctionScreen extends StatefulWidget {
  const AddAuctionScreen({Key? key}) : super(key: key);

  @override
  State<AddAuctionScreen> createState() => _AddAuctionScreenState();
}

class _AddAuctionScreenState extends State<AddAuctionScreen> {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  @override
  void initState() {
    Get.put(AddAuctionController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = AddAuctionController.find;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            right: Get.locale == const Locale('ar') ? -100 : null,
            left: Get.locale == const Locale('en') ? -100 : null,
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
          SingleChildScrollView(
            child: SizedBox(
              height: Get.height * 1.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 45,
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
                                onPressed: () {
                                  Get.back();
                                },
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Text(
                            'choose the advertisement section'.tr,
                            style: const TextStyle(
                              color: MyColors.primary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder(
                          future: controller.initializeCategoriesFuture,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.done:
                              default:
                                if (snapshot.hasData) {
                                  return SizedBox(
                                    height: 100,
                                    child: ListView.separated(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                              .categoriesModel?.data?.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        return GetBuilder<AddAuctionController>(
                                            builder: (value) {
                                          return InkWell(
                                            onTap: () {
                                              value.selectedCategory = MapEntry(
                                                  index.toString(),
                                                  value.categoriesModel
                                                          ?.data?[index].id
                                                          .toString() ??
                                                      '0');
                                              value.update();
                                            },
                                            child: CustomCategoryItem(
                                              url: controller.categoriesModel
                                                      ?.data?[index].image ??
                                                  '',
                                              name: controller.categoriesModel
                                                      ?.data?[index].name ??
                                                  '',
                                              isChecked: controller
                                                      .selectedCategory.key ==
                                                  index.toString(),
                                            ),
                                          );
                                        });
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          width: 10,
                                        );
                                      },
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return const FailureWidget();
                                } else {
                                  return const FailureWidget();
                                }
                            }
                          },
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: controller.addressController,
                                    color: MyColors.textFieldColor,
                                    hint: 'address'.tr,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    controller:
                                        controller.descriptionController,
                                    color: MyColors.textFieldColor,
                                    maxLines: 10,
                                    hint: 'description'.tr,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await controller.pickImage();
                                    },
                                    child: AbsorbPointer(
                                      child: CustomTextField(
                                        controller:
                                            controller.mainPictureController,
                                        color: MyColors.textFieldColor,
                                        hint: 'main picture'.tr,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await controller.pickMultipleImages();
                                    },
                                    child: AbsorbPointer(
                                      child: CustomTextField(
                                        controller:
                                            controller.morePicturesController,
                                        color: MyColors.textFieldColor,
                                        hint: 'more pictures'.tr,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    controller: controller
                                        .auctionStartingPriceController,
                                    color: MyColors.textFieldColor,
                                    hint: 'auction starting price'.tr,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    controller:
                                        controller.directSellPriceController,
                                    color: MyColors.textFieldColor,
                                    hint: 'direct sell price'.tr,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
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
                                        const Duration(
                                          seconds: 1,
                                        ),
                                        () async {
                                          _key.currentState?.reset();
                                          //controller.getListOfFiles();
                                          await controller.fetchAddAuctionData(
                                            context: context,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
