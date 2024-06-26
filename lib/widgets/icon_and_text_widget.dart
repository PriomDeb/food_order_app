// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_order_app/utils/dimensions.dart';
import 'package:food_order_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.responsiveHeight(24),
        ),
        SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}
