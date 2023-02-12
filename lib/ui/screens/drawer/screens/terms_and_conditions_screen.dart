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
                // title: FittedBox(
                //   child: Text(
                //     'terms and conditions'.tr,
                //     style: const TextStyle(
                //       color: MyColors.primary,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                leadingWidth: 70,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                          top: 10,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: FutureBuilder<PageModel?>(
                                future: controller.initializePageFuture,
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return const SizedBox(
                                        height: 400,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    case ConnectionState.done:
                                    default:
                                      if (snapshot.hasData) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data?.data?.title ?? '',
                                              style: const TextStyle(
                                                fontSize: 28,
                                                color: MyColors.primary,
                                              ),
                                            ),
                                            Html(
                                                data: snapshot.data?.data
                                                            ?.content ==
                                                        null
                                                    ? """<h1>Privacy Policy for Yalla Mazad</h1>

<p>At Yalla Mazad, accessible from https://yallamzad.com/, one of our main priorities is the privacy of our visitors.
	This Privacy Policy document contains types of information that is collected and recorded by Yalla Mazad and how we
	use it.</p>

<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.
</p>

<h2>Log Files</h2>

<p>Yalla Mazad follows a standard procedure of using log files. These files log visitors when they visit websites. All
	hosting companies do this and a part of hosting services' analytics. The information collected by log files include
	internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit
	pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable.
	The purpose of the information is for analyzing trends, administering the site, tracking users' movement on the
	website, and gathering demographic information. Our Privacy Policy was created with the help of the <a
		href="https://www.privacypolicygenerator.org">Privacy Policy Generator</a>.</p>

<h2>Cookies and Web Beacons</h2>

<p>Like any other website, Yalla Mazad uses 'cookies'. These cookies are used to store information including visitors'
	preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize
	the users' experience by customizing our web page content based on visitors' browser type and/or other information.
</p>



<h2>Privacy Policies</h2>

<P>You may consult this list to find the Privacy Policy for each of the advertising partners of Yalla Mazad.</p>

<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in
	their respective advertisements and links that appear on Yalla Mazad, which are sent directly to users' browser.
	They automatically receive your IP address when this occurs. These technologies are used to measure the
	effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites
	that you visit.</p>

<p>Note that Yalla Mazad has no access to or control over these cookies that are used by third-party advertisers.</p>

<h2>Third Party Privacy Policies</h2>

<p>Yalla Mazad Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the
	respective Privacy Policies of these third-party ad servers for more detailed information. It may include their
	practices and instructions about how to opt-out of certain options. </p>

<p>You can choose to disable cookies through your individual browser options. To know more detailed information about
	cookie management with specific web browsers, it can be found at the browsers' respective websites.</p>

<h2>Children's Information</h2>

<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and
	guardians to observe, participate in, and/or monitor and guide their online activity.</p>

<p>Yalla Mazad does not knowingly collect any Personal Identifiable Information from children under the age of 13. If
	you think that your child provided this kind of information on our website, we strongly encourage you to contact us
	immediately and we will do our best efforts to promptly remove such information from our records.</p>

<h2>Online Privacy Policy Only</h2>

<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to
	the information that they shared and/or collect in Yalla Mazad. This policy is not applicable to any information
	collected offline or via channels other than this website.</p>

<h2>Consent</h2>

<p>By using our website, you hereby consent to our Privacy Policy and agree to its Terms and Conditions.</p>"""
                                                    : """${snapshot.data?.data?.content}"""
                                                // data: """${snapshot.data?.data?.content}""",
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
            ),
          ),
        ],
      ),
    );
  }
}
