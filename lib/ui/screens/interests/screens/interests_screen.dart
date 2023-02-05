import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/plans/plans_binding.dart';
import 'package:yalla_mazad/controller/interests/interests_controller.dart';
import 'package:yalla_mazad/model/interests/interests_model.dart';
import 'package:yalla_mazad/ui/screens/plans/screens/plans_screen.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../widgets/failure_widget.dart';
import '../widgets/interest_item.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = InterestsController.find;
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
                  ),
                  Positioned(
                    right: 130,
                    top: 80,
                    child: IconButton(
                      onPressed: () {
                        Get.to(
                          () => const PlansScreen(),
                          binding: PlansBinding(),
                        );
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: MyColors.primary,
                        size: 25,
                      ),
                    ),
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
                const Expanded(flex: 1, child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'congratulations'.tr,
                            style: const TextStyle(
                              color: MyColors.red,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'you have been registered successfully'.tr,
                            style: const TextStyle(
                              color: MyColors.primary,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'help us know your interests to give you the best'.tr,
                      style: const TextStyle(
                        color: MyColors.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FutureBuilder<InterestsModel?>(
                        future: controller.initializeInterestsFuture,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.done:
                            default:
                              if (snapshot.hasData) {
                                return Wrap(
                                  spacing: 10,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  runSpacing: 10,
                                  children: List.generate(
                                    controller.interestsModel?.data?.length ??
                                        0,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (!controller.selectedInterests
                                              .contains(snapshot
                                                  .data?.data?[index].id
                                                  .toString())) {
                                            controller.selectedInterests.add(
                                                snapshot.data?.data?[index].id
                                                        .toString() ??
                                                    '0');
                                          } else {
                                            controller.selectedInterests.remove(
                                                snapshot.data?.data?[index].id
                                                        .toString() ??
                                                    '0');
                                          }
                                        });
                                      },
                                      child: InterestItem(
                                        content:
                                            snapshot.data?.data?[index].name ??
                                                '',
                                        isChosen: controller.selectedInterests
                                            .contains(
                                          snapshot.data?.data?[index].id
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return const FailureWidget();
                              } else {
                                return const FailureWidget();
                              }
                          }
                        }),
                  ],
                ),
                const Expanded(flex: 2, child: SizedBox()),
                GestureDetector(
                  onTap: () async {
                    await controller.fetchAddCategoriesData(
                        categories: controller.selectedInterests,
                        context: context);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: MyColors.primary,
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'next'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
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
}
