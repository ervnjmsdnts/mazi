import 'package:flutter/material.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_font.dart';

class RegularText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign textAlign;
  const RegularText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color = const Color(AppColors.textColor),
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class LightText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  const LightText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color = const Color(AppColors.textColor)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: AppFonts.light,
      ),
    );
  }
}
