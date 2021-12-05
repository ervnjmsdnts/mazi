import 'package:flutter/material.dart';
import 'package:mazi/const/app_font.dart';
import 'package:mazi/views/widgets/custom_texts.dart';

class Button extends StatelessWidget {
  final String text;
  final int color;
  final void Function() function;
  final double width;
  final double height = 35;
  const Button(
      {Key? key,
      required this.text,
      required this.color,
      required this.function,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: RegularText(
        text: text,
        fontSize: AppFontSizes.subSize,
      ),
      onPressed: function,
      style: TextButton.styleFrom(
        backgroundColor: Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minimumSize: Size(width, height),
      ),
    );
  }
}
