import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../utils/images.dart';
import '../../utils/screen_size.dart';

class CustomSlideButton extends StatelessWidget {
  final double borderRadius;
  final double height;
  final bool reversed;
  final Color color;
  final GlobalKey<SlideActionState> stateKey;
  final String text;
  final Function() onSubmitted;

  const CustomSlideButton(
      {required this.borderRadius,
      required this.height,
      this.reversed = true,
      required this.color,
      required this.stateKey,
      required this.text,
        required this.onSubmitted,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      borderRadius: borderRadius,
      height: height,
      reversed: reversed,
      outerColor: color,
      text: text,
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      sliderButtonIcon: RotatedBox(
        quarterTurns: 2,
        child: Image.asset(
          MyImages.doubleArrow,
          width: ScreenSize.phoneSize(
            18,
            height: true,
          ),
          height: ScreenSize.phoneSize(
            18,
            height: false,
          ),
        ),
      ),
      key: stateKey,
      onSubmit: onSubmitted,
    );
  }
}
