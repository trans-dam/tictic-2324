import 'package:flutter/material.dart';

import '../../styles/font.dart';
import '../../styles/spacings.dart';

@immutable
class BigStat extends StatelessWidget {
  const BigStat({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: kTagLine,
          ),
          const SizedBox(
            height: kVerticalPaddingS,
          ),
          Text(
            '$value€',
            style: kTitleBigStat,
          ),
        ],
      ),
    );
  }
}
