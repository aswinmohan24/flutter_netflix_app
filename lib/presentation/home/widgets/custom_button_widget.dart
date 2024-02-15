import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize = 30,
    this.textSize = 18,
    this.opacity = 1,
  });
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: textSize, color: kWhiteColor.withOpacity(opacity)),
        )
      ],
    );
  }
}
