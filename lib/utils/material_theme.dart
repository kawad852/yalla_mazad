import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/colors.dart';

class AppThemeData {
  ThemeData get materialTheme {
    return ThemeData(
      fontFamily: "Tajawal",
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.primary,
        primary: MyColors.primary,
        secondary: MyColors.secondary,
      ),
      // textTheme: const TextTheme(
      //   bodyText2: TextStyle(
      //     color: MyColors.textColor,
      //   ),
      //   headline6: TextStyle(color: MyColors.textColor),
      //   headline5: TextStyle(color: MyColors.textColor),
      //   headline4: TextStyle(color: MyColors.textColor),
      // ),
    );
  }
}
