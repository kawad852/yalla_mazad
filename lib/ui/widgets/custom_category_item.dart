import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';

import 'custom_network_image.dart';

class CustomCategoryItem extends StatelessWidget {
  final String? url;
  final String? name;
  final bool isChecked;
  const CustomCategoryItem(
      {required this.url, required this.name, this.isChecked = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: !isChecked
                  ? const Color.fromRGBO(
                      175,
                      164,
                      197,
                      0.8,
                    )
                  : const Color(0xffDF3264).withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Center(
              child: CustomNetworkImage(
                url: '$url',
                radius: 15,
                margin: const EdgeInsets.all(5),
                // width: 40,
                // height: 40,
              ),
            ),
            // child: const Center(
            //   child: Icon(
            //     Icons.account_box_outlined,
            //     color: MyColors.primary,
            //   ),
            // ),
          ),
          Text(
            name ?? '',
            style: const TextStyle(
              color: MyColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
