import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/font.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kVerticalPaddingS,
          left: kHorizontalPaddingS,
          right: kHorizontalPaddingS),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: kVerticalPaddingS, horizontal: kHorizontalPadding),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [kShadow]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '30/07/2023',
              style: kSmallText.apply(color: kMainColor.withOpacity(0.6)),
            ),
            Text(
              'Arnaud - Dépenses',
              style: kSmallText,
            ),
            Text(
              '300,00€',
              style: kSmallText,
            ),
          ],
        ),
      ),
    );
  }
}
