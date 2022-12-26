import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

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
      //color: Colors.red,
      height: 146,
      child: Row(
        children: [
          Container(
            height: 140,
            width: 140,
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
                strokeAlign: StrokeAlign.inside,
              ),
            ),
            child: CustomNetworkImage(
              url: image!,
              radius: 18,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: MyColors.red,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.alarm,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            '1:23:02:00',
                            style: TextStyle(
                              color: MyColors.primary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
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
                                width: 20,
                                height: 20,
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
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                      child: CustomNetworkImage(
                        radius: 6,
                        url: userImage!,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userName!,
                      style: const TextStyle(
                        color: MyColors.primary,
                        fontSize: 12,
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
