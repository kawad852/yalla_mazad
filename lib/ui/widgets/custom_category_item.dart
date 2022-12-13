import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: const Center(
              child: Icon(
                Icons.account_box_outlined,
                color: MyColors.primary,
              ),
            ),
          ),
          const Text(
            'cars',
            style: TextStyle(
              color: MyColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
