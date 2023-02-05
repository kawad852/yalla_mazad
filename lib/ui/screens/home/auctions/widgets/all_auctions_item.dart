import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/ui/widgets/custom_countdown_timer.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../../widgets/custom_network_image.dart';

class AllAuctionsItem extends StatefulWidget {
  final String? image;
  final String? name;
  final String? details;
  final int? id;
  final String? userImage;
  final String? userName;
  final String? startDate;
  final String? endDate;

  const AllAuctionsItem(
      {required this.image,
      required this.name,
      required this.details,
      required this.id,
      required this.userImage,
      required this.userName,
      required this.startDate,
      required this.endDate,
      Key? key})
      : super(key: key);

  @override
  State<AllAuctionsItem> createState() => _AllAuctionsItemState();
}

class _AllAuctionsItemState extends State<AllAuctionsItem> {
  RxInt highestPrice = 0.obs;
  var seconds = 0;

  ///0 means coming, 1 current, 2 done
  RxInt status = 0.obs;
  var secondsToStart = 0;

  @override
  void initState() {
    var items = FirebaseFirestore.instance
        .collection('auctions')
        .doc(widget.id.toString())
        .collection('biddings')
        .orderBy('amount', descending: true)
        .snapshots();
    items.listen((snapshot) {
      var currentPrice = snapshot.docs.isNotEmpty
          ? snapshot.docs.first.get('amount').toString().obs
          : "0".obs;
      highestPrice.value = int.parse(currentPrice.value);
    });
    secondsToStart = DateTime.parse(widget.startDate ?? '')
        .difference(DateTime.now())
        .inSeconds;
    seconds = DateTime.parse(widget.endDate ?? '')
        .difference(DateTime.now())
        .inSeconds;
    if (secondsToStart > 0) {
      status.value = 0;
      int remaining = secondsToStart;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (remaining == 0) {
          timer.cancel();
          status.value = 1;
          log('timer for coming is done and status is: ${status.value}');
        } else {
          remaining--;
          log('timer for coming is moving and remaining is is: $remaining');
        }
        setState(() {});
      });
    } else if (seconds == 0) {
      status.value = 2;
    } else if (secondsToStart <= 0 && seconds > 0) {
      status.value = 1;
    }
    log('seconds: $seconds');
    log('secondsToStart: $secondsToStart');
    log('status: ${status.value}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.phoneSize(
        126,
        height: true,
      ),
      child: Row(
        children: [
          Container(
            height: ScreenSize.phoneSize(
              120,
              height: true,
            ),
            width: ScreenSize.phoneSize(
              120,
              height: true,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25,
              ),
              border: Border.all(
                color: const Color.fromRGBO(
                  228,
                  225,
                  232,
                  1,
                ),
                width: 7,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: CustomNetworkImage(
                url: widget.image!, defaultUrl: MyImages.logo, radius: 18),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name!,
                  style: const TextStyle(
                    color: MyColors.primary,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.details!,
                  maxLines: 3,
                  style: const TextStyle(
                    color: MyColors.primary,
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: ScreenSize.phoneSize(
                              25,
                              height: false,
                            ),
                            height: ScreenSize.phoneSize(
                              25,
                              height: false,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: MyColors.red,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.alarm,
                                color: Colors.white,
                                size: ScreenSize.phoneSize(
                                  20,
                                  height: false,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Flexible(
                            child: FittedBox(
                              child: Obx(
                                () => status.value == 2
                                    ? Text(
                                        'done auction'.tr,
                                        style: const TextStyle(
                                          color: MyColors.primary,
                                        ),
                                      )
                                    : status.value == 1
                                        ? CountDownTimer(
                                            secondsRemaining: seconds,
                                            whenTimeExpires: () {
                                              setState(
                                                () {
                                                  status.value = 2;
                                                },
                                              );
                                              log('timer for current is done and status is: ${status.value}');
                                            },
                                          )

                                        ///TODO add date and format it
                                        : Text(
                                            'coming auction'.tr,
                                            style: const TextStyle(
                                              color: MyColors.primary,
                                            ),
                                          ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: ScreenSize.phoneSize(
                              25,
                              height: false,
                            ),
                            height: ScreenSize.phoneSize(
                              25,
                              height: false,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: MyColors.primary,
                            ),
                            child: Center(
                              child: Image.asset(
                                MyImages.justice,
                                color: Colors.white,
                                width: ScreenSize.phoneSize(
                                  20,
                                  height: false,
                                ),
                                height: ScreenSize.phoneSize(
                                  20,
                                  height: false,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Obx(
                            () => Text(
                              '${highestPrice.value.toString()} JOD',
                              style: const TextStyle(
                                color: MyColors.primary,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: ScreenSize.phoneSize(
                        25,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        25,
                        height: false,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                      child: CustomNetworkImage(
                        radius: 6,
                        url: widget.userImage!,
                        defaultUrl: MyImages.noProfile,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.phoneSize(
                        10,
                        height: false,
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          widget.userName!,
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
