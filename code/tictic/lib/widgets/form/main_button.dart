import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/others.dart';
import '../../styles/spacings.dart';

@immutable
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
            vertical: kVerticalPaddingS, horizontal: kHorizontalPadding),
        decoration: BoxDecoration(
          color: isSeedColor ? kMainColor : kTertiaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            kShadow,
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
              color: isSeedColor ? kBackgroundColor : kMainColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
