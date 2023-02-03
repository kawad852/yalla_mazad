import 'package:flutter/material.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';
import 'package:yalla_mazad/utils/colors.dart';

import '../../../../utils/images.dart';

class BiddingItem extends StatelessWidget {
  final int order;
  final String name;
  final String image;
  final String amount;
  final bool isLast;
  const BiddingItem({
    required this.name,
    required this.image,
    required this.amount,
    required this.order,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: order == 1
            ? const BorderRadius.vertical(
                top: Radius.circular(
                  25,
                ),
              )
            : isLast
                ? const BorderRadius.vertical(
                    bottom: Radius.circular(
                      25,
                    ),
                  )
                : BorderRadius.zero,
        color: order == 1
            ? MyColors.yellow400.withOpacity(
                0.3,
              )
            : order % 2 == 0
                ? MyColors.textFieldColor
                : Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Text(
            order.toString(),
            style: const TextStyle(
              color: MyColors.primary,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CustomNetworkImage(
            url: image,
            defaultUrl: MyImages.noProfile,
            radius: 20,
            width: 52,
            height: 52,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: Color(
                  0xff333333,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '$amount JOD',
            style: const TextStyle(
              color: MyColors.primary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
