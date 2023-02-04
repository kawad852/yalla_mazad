import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/drawer/terms_and_conditions_controller.dart';
import 'package:yalla_mazad/model/page/page_model.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../widgets/failure_widget.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final controller = TermsAndConditionsController.find;

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
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              left: 35,
              right: 35,
            ),
            child: SafeArea(
              bottom: false,
              child: SizedBox(
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
                          return const FailureWidget();
                        } else {
                          return const FailureWidget();
                        }
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
