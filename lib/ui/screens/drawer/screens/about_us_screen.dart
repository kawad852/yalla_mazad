import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/drawer/about_us_controller.dart';
import 'package:yalla_mazad/model/page/page_model.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../widgets/failure_widget.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final controller = AboutUsController.find;

  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 45,
                      left: 35,
                      right: 35,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: MyColors.primary,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'who we are'.tr,
                              style: const TextStyle(
                                color: MyColors.primary,
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Get.width,
                          child: FutureBuilder<PageModel?>(
                            future: controller.initializePageFuture,
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                case ConnectionState.done:
                                default:
                                  if (snapshot.hasData) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data?.data?.title ?? '',
                                          style: const TextStyle(
                                            fontSize: 28,
                                            color: MyColors.primary,
                                          ),
                                        ),
                                        Html(
                                          data: """${snapshot.data?.data?.content}""",
                                        ),
                                      ],
                                    );
                                  } else if (snapshot.hasError) {
                                    return Column(
                                      children: const [
                                        SizedBox(
                                          height: 300,
                                          child: FailureWidget(),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      children: const [
                                        SizedBox(
                                          height: 300,
                                          child: FailureWidget(),
                                        ),
                                      ],
                                    );
                                  }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
