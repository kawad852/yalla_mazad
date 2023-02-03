import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';

import '../../../../widgets/custom_network_image.dart';

class AllAuctionsItem extends StatelessWidget {
  final String? image;
  final String? name;
  final String? details;
  final String? price;
  final String? userImage;
  final String? userName;

  ///TODO: add time left
  const AllAuctionsItem(
      {required this.image,
      required this.name,
      required this.details,
      required this.price,
      required this.userImage,
      required this.userName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 146,
      height: ScreenSize.phoneSize(
        126,
        height: true,
      ),
      child: Row(
        children: [
          Container(
            // height: 140,
            // width: 140,
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
              url: image!,
              defaultUrl: MyImages.logo,
              radius: 18
            ),
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
                  name!,
                  style: const TextStyle(
                    color: MyColors.primary,
                    fontSize: 16,
                  ),
                ),
                Text(
                  details!,
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
                          const Flexible(
                            child: FittedBox(
                              child: Text(
                                '1:23:02:00',
                                style: TextStyle(
                                  color: MyColors.primary,
                                  fontSize: 12,
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
                          Text(
                            price!,
                            style: const TextStyle(
                              color: MyColors.primary,
                              fontSize: 12,
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
                        url: userImage!,
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
                          userName!,
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
