import 'package:flutter/material.dart';

class IntroCardItem extends StatelessWidget {
  final double? width;
  final double? height;
  final String? image;
  const IntroCardItem({required this.height, required this.width, required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
         strokeAlign: StrokeAlign.outside,
        ),
        image: DecorationImage(
          image: AssetImage(
            image!,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
