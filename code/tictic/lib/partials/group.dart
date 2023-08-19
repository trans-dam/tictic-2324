import 'package:flutter/material.dart';

import '../style/spacings.dart';
import 'TransactionCard.dart';
import 'group_card.dart';

class Group extends StatelessWidget {
  const Group({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GroupCard(),
        SizedBox(
          height: kVerticalPaddingS,
        ),
        TransactionCard(),
        TransactionCard(),
        TransactionCard(),
        SizedBox(
          height: kVerticalPaddingL,
        ),
      ],
    );
  }
}
