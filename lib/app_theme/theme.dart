import 'package:demo_shop/app_theme/app_color.dart';
import 'package:flutter/material.dart';


class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.background,
    cardTheme: const CardTheme(color: AppColors.background),
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    dividerColor: AppColors.lightGrey,
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.titleTextColor),
    ), bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.background),
  );

  static List<BoxShadow> shadow = <BoxShadow>[
    const BoxShadow(color: Color(0xff080808), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
  const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
