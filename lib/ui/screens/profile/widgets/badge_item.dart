import 'package:flutter/material.dart';
import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';
import 'package:yalla_mazad/utils/colors.dart';

class BadgeItem extends StatelessWidget {
  final String? image;
  final String? message;
  const BadgeItem({required this.message,required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///TODO: make sure
    return Tooltip(
      message: message!,
      textStyle: const TextStyle(
        color: MyColors.primary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.textFieldColor,
      ),
      showDuration: const Duration(seconds: 2),
      waitDuration: const Duration(seconds: 1),
      child: Container(
        width: 47,
        height: 47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: CustomNetworkImage(
          radius: 15,
          url: image!,
        ),
      ),
    );
  }
}
