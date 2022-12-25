import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../../widgets/custom_network_image.dart';

class MyAuctionItem extends StatelessWidget {
  final String? image;
  final String? name;
  final String? details;
  final String? status;
  final String? price;

  ///TODO: add time left
  const MyAuctionItem(
      {required this.image,
      required this.name,
      required this.details,
      required this.price,
      required this.status,
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
              ///TODO: change all text style when i get the design
              children: [
                Text(
                  name!,
                  style: const TextStyle(
                    color: MyColors.primary,
                  ),
                ),
                Text(
                  details!,
                  maxLines: 3,
                  style: const TextStyle(
                    color: MyColors.primary,
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
                          const SizedBox(width: 4,),
                          const Text(
                            '1:23:02:00',
                            style: TextStyle(
                              color: MyColors.primary,
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
                          const SizedBox(width: 4,),
                          Text(
                            price!,
                            style: const TextStyle(
                              color: MyColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  status!,
                  style: const TextStyle(),
                  ///TODO: change color according to status
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
