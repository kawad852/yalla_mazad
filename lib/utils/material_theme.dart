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
      // textTheme:  const TextTheme(
      //   bodyMedium: TextStyle(
      //     color: MyColors.textColor,
      //   ),
      //   titleLarge: TextStyle(color: MyColors.textColor),
      //   headlineSmall: TextStyle(color: MyColors.textColor),
      //   headlineMedium: TextStyle(color: MyColors.textColor),
      // ),
    );
  }
}
