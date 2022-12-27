import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';

class NotificationItem extends StatelessWidget {
  final String? user;
  final String? content;
  final String? date;
  const NotificationItem({
    required this.user,
    required this.content,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(
        top: 5,
      ),
      child: Row(
        children: [
          Radio(
            value: true,
            groupValue: true,
            onChanged: (value) {},
            activeColor: MyColors.primary,
            splashRadius: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: user!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: content!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: MyColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                date!,

                style: const TextStyle(
                  fontSize: 12,
                  color: MyColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
