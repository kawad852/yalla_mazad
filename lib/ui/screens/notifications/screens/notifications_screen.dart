
import 'package:flutter/material.dart';
import 'package:yalla_mazad/ui/screens/notifications/widgets/notification_item.dart';

import '../../../../utils/colors.dart';

import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    padding: const EdgeInsets.only(
                      right: 4,
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
                    'notifications'.tr,
                    style: const TextStyle(
                      color: MyColors.primary,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return NotificationItem(user: 'mohammed',
                        content: 'added a new ad',
                        date: DateTime.now().toString(),

                      );
                    },
                    separatorBuilder: (context, index) {
                      return Column(
                        children: const [
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            indent: 5,
                            endIndent: 5,
                            color: Colors.black26,
                            thickness: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
