import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/screen_size.dart';
import '../../../../widgets/custom_countdown_timer.dart';

class AuctionItem extends StatefulWidget {
  final String? image;
  final String? name;
  final String? user;
  final int? id;
  final String? startDate;
  final String? endDate;

  const AuctionItem(
      {required this.image,
      required this.name,
      required this.user,
      required this.id,
      required this.startDate,
      required this.endDate,
      Key? key})
      : super(key: key);

  @override
  State<AuctionItem> createState() => _AuctionItemState();
}

class _AuctionItemState extends State<AuctionItem> {
  RxInt highestPrice = 0.obs;
  var seconds = 0;
  RxBool isDone = false.obs;

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
    seconds = DateTime.parse(widget.endDate ?? '')
        .difference(DateTime.now())
        .inSeconds;
    if (seconds == 0) {
      isDone.value = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.phoneSize(
        180,
        height: false,
      ),
      height: ScreenSize.phoneSize(
        180,
        height: false,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ScreenSize.phoneSize(
              180,
              height: false,
            ),
            width: ScreenSize.phoneSize(
              180,
              height: false,
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
            child: SizedBox(
              height: ScreenSize.phoneSize(
                190,
                height: false,
              ),
              width: ScreenSize.phoneSize(
                190,
                height: false,
              ),
              child: Stack(
                children: [
                  CustomNetworkImage(
                    url: widget.image!,
                    defaultUrl: MyImages.logo,
                    radius: 18,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: ScreenSize.phoneSize(
                        72,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        23,
                        height: false,
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(25)),
                        color: MyColors.primary,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Obx(
                            () => Text(
                              '${highestPrice.value} JOD',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: ScreenSize.phoneSize(
                        72,
                        height: false,
                      ),
                      height: ScreenSize.phoneSize(
                        23,
                        height: false,
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(25)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Obx(
                            () => isDone.value
                                ? Text(
                                    'done auction'.tr,
                                    style: const TextStyle(
                                      color: MyColors.primary,
                                    ),
                                  )
                                : CountDownTimer(
                                    secondsRemaining: seconds,
                                    whenTimeExpires: () {
                                      setState(
                                        () {
                                          isDone.value = true;
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.name!,
              style: const TextStyle(
                color: MyColors.primary,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.user!,
              style: const TextStyle(
                color: MyColors.greyText,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
