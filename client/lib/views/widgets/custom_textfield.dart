import 'package:flutter/material.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_font.dart';
import 'package:mazi/views/widgets/custom_texts.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool password;
  const CustomFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: RegularText(
            text: label,
            fontSize: AppFontSizes.mainSize,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(AppColors.bluey),
            ),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: password,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Chivo-Light',
              fontSize: 17,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusColor: Color(AppColors.purply),
            ),
            cursorColor: const Color(AppColors.accentPinky),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
