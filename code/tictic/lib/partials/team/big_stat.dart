import 'package:flutter/material.dart';

import '../../style/font.dart';
import '../../style/spacings.dart';

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
    return Column(
      children: [
        Text(
          label,
          style: kTitleHome,
        ),
        const SizedBox(
          height: kVerticalPaddingS,
        ),
        Text(
          '$value€',
          style: kTitleHome.copyWith(height: 1),
        ),
      ],
    );
  }
}
