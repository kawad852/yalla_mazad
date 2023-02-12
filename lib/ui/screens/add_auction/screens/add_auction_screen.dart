import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/add_auction/add_auction_controller.dart';
import 'package:yalla_mazad/controller/home/custom_navigation_bar_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_category_item.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/ui/widgets/failure_widget.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../widgets/custom_shimmer_loading.dart';
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
  void dispose() {
    Get.delete<AddAuctionController>();
    super.dispose();
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
          SafeArea(
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                primary: false,
                toolbarHeight: 35,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: FittedBox(
                  child: Text(
                    'add auction'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ),
                leadingWidth: 72,
                leading: GestureDetector(
                  onTap: () {
                    CustomNavigationBarController.find.tabController
                        .jumpToTab(0);
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 35,
                    ),
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsetsDirectional.only(
                        start: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xffD3CFDC,
                        ),
                        borderRadius: BorderRadius.circular(
                          7,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: MyColors.primary,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
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
                                    return SizedBox(
                                      height: 100,
                                      child: ListView.separated(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 30,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: const [
                                              CustomShimmerLoading(
                                                radius: 15,
                                                width: 60,
                                                height: 60,
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            width: 10,
                                          );
                                        },
                                      ),
                                    );
                                  case ConnectionState.done:
                                  default:
                                    if (snapshot.hasData) {
                                      return SizedBox(
                                        height: 100,
                                        child: ListView.separated(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                          ),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.categoriesModel
                                                  ?.data?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            return GetBuilder<
                                                    AddAuctionController>(
                                                builder: (value) {
                                              return InkWell(
                                                onTap: () {
                                                  value.selectedCategory =
                                                      MapEntry(
                                                          index.toString(),
                                                          value
                                                                  .categoriesModel
                                                                  ?.data?[index]
                                                                  .id
                                                                  .toString() ??
                                                              '0');
                                                  value.update();
                                                },
                                                child: CustomCategoryItem(
                                                  url: controller
                                                          .categoriesModel
                                                          ?.data?[index]
                                                          .image ??
                                                      '',
                                                  name: controller
                                                          .categoriesModel
                                                          ?.data?[index]
                                                          .name ??
                                                      '',
                                                  isChecked: controller
                                                          .selectedCategory
                                                          .key ==
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: controller.addressController,
                                    color: MyColors.textFieldColor,
                                    hint: 'address'.tr,
                                    validator: (text) {
                                      if (text == '' || text!.isEmpty) {
                                        return 'cannot be empty'.tr;
                                      }
                                      return null;
                                    },
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
                                    validator: (text) {
                                      if (text == '' || text!.isEmpty) {
                                        return 'cannot be empty'.tr;
                                      }
                                      return null;
                                    },
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
                                        suffixIcon: SizedBox(
                                          width: 60,
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              InkWell(
                                                child: SvgPicture.asset(
                                                  MyImages.clip,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
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
                                        suffixIcon: SizedBox(
                                          width: 60,
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              InkWell(
                                                child: SvgPicture.asset(
                                                  MyImages.clip,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
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
                                    validator: (text) {
                                      if (text == '' || text!.isEmpty) {
                                        return 'cannot be empty'.tr;
                                      }
                                      return null;
                                    },
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
                                    validator: (text) {
                                      if (text == '' || text!.isEmpty) {
                                        return 'cannot be empty'.tr;
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  CustomSlideButton(
                                    borderRadius: 25,
                                    height: 67,
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
                                    height: 150,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
