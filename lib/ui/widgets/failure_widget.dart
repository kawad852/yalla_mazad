import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/app_constants.dart';
import 'package:yalla_mazad/utils/colors.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppConstants.failedMessage,
        style: const TextStyle(
          color: MyColors.primary,
          fontSize: 18,
        ),
      ),
    );
  }
}
