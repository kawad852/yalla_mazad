import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';

class InterestItem extends StatefulWidget {
  final String content;
  final bool isChosen;
  const InterestItem({required this.content, required this.isChosen, Key? key})
      : super(key: key);

  @override
  State<InterestItem> createState() => _InterestItemState();
}

class _InterestItemState extends State<InterestItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: widget.isChosen ? MyColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(
          17,
        ),
        border: Border.all(
          strokeAlign: StrokeAlign.inside,
          width: 1,
          color: const Color(
            0xff2D0050,
          ),
        ),
      ),
      child: Text(
        widget.content,
        style: TextStyle(
          color: widget.isChosen ? Colors.white : MyColors.primary,
          fontSize: 14,
        ),
      ),
    );
  }
}
