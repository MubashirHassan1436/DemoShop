import 'package:flutter/material.dart';

import '../app_theme/app_color.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {super.key,
      required this.text,
      this.fontSize = 18,
      this.color = AppColors.titleTextColor,
      this.fontWeight = FontWeight.w800});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      maxLines: 2,
    );
  }
}
