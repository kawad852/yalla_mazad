import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';

class InterestItem extends StatelessWidget {
  final String content;
  final bool isChosen;
  const InterestItem({required this.content, required this.isChosen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: isChosen ? MyColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(
          17,
        ),
        border: Border.all(
          strokeAlign: StrokeAlign.inside,
          width: 1,
          color: Color(
            0xff2D0050,
          ),
        ),
      ),
      child: Text(
        content,
        style: TextStyle(
          color: isChosen ? Colors.white : MyColors.primary,
          fontSize: 14,
        ),
      ),
    );
  }
}
