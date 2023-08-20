import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tictic/models/transaction.dart';

import '../style/colors.dart';
import '../style/font.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({
    super.key,
    required this.transaction,
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
              DateFormat.yMd('fr').format(transaction.date),
              style: kSmallText.apply(color: kMainColor.withOpacity(0.6)),
            ),
            Text(
              transaction.title,
              style: kSmallText,
            ),
            Text(
              "${transaction.amount}€",
              style: kSmallText,
            ),
          ],
        ),
      ),
    );
  }
}
