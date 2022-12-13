import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';

class AuctionItem extends StatelessWidget {
  final String content;
  final bool isChosen;
  const AuctionItem({required this.content, required this.isChosen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: isChosen ? MyColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(
          17,
        ),
        border: Border.all(
          //TODO: joudi
          // strokeAlign: StrokeAlign.inside,
          width: 1,
          color: const Color(
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
