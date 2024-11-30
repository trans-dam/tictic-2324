import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/others.dart';
import '../../styles/spacings.dart';

@immutable
class LineItem extends StatelessWidget {
  final bool isActivated;
  final double width;

  const LineItem({super.key, this.isActivated = false, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kVerticalPadding * 2),
      child: Container(
        height: 3,
        width: width,
        decoration: BoxDecoration(
          color: isActivated ? kMainColor : kBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            kShadow,
          ],
        ),
      ),
    );
  }
}
