import 'package:flutter/material.dart';
import 'package:tictic/style/spacings.dart';

import '../style/colors.dart';
import '../style/others.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isSeedColor;

  const MainButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isSeedColor = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: vPadding / 2, horizontal: hPadding),
        decoration: BoxDecoration(
          color: isSeedColor ? seedColor : tertiaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            shadow,
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
              color: isSeedColor ? backgroundColor : seedColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
