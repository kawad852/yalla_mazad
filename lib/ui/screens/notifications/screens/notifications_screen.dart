import 'package:flutter/material.dart';
import 'package:yalla_mazad/controller/notifications/notifications_controller.dart';
import 'package:yalla_mazad/model/my_notifications/my_notifications_model.dart';
import 'package:yalla_mazad/ui/screens/notifications/widgets/notification_item.dart';

import '../../../../utils/colors.dart';

import 'package:get/get.dart';

import '../../../widgets/failure_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = NotificationsController.find;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              left: 35,
              right: 35,
            ),
            child: Row(
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder<MyNotificationsModel?>(
                    future: controller.initializeMyNotificationsFuture,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        case ConnectionState.done:
                        default:
                          if (snapshot.hasData) {
                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              shrinkWrap: true,
                              itemCount: snapshot.data?.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                return NotificationItem(
                                  user: snapshot.data?.data?[index].user?.name,
                                  content: snapshot.data?.data?[index].content,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
