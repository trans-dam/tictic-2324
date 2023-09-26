import 'package:flutter/material.dart';

import '../../styles/spacings.dart';
import 'big_stat.dart';

@immutable
class BigStatContainer extends StatelessWidget {
  const BigStatContainer({
    super.key,
    required this.label1,
    required this.label2,
    required this.value1,
    required this.value2,
  });

  final String label1;
  final String label2;
  final double value1;
  final double value2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        image: DecorationImage(
          image: AssetImage("assets/img/back2.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.only(
          left: kHorizontalPadding,
          right: kHorizontalPadding,
          top: kVerticalPadding,
          bottom: kVerticalPaddingXL + kVerticalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigStat(label: label1, value: value1),
          BigStat(label: label2, value: value2),
        ],
      ),
    );
  }
}
