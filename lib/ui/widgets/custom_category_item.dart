import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';

import 'custom_network_image.dart';

class CustomCategoryItem extends StatelessWidget {
  final String? url;
  final String? name;
  const CustomCategoryItem({required this.url, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.red,
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(
                175,
                164,
                197,
                0.8,
              ),
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Center(
              child: CustomNetworkImage(
                url: '${url}',
                radius: 15,
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
