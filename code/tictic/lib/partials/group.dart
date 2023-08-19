import 'package:flutter/material.dart';
import 'package:tictic/style/font.dart';

import '../style/spacings.dart';
import 'TransactionCard.dart';
import 'group_card.dart';

class Group extends StatefulWidget {
  const Group({
    super.key,
  });

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  bool isExpand = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GroupCard(),
        ExpansionTile(
          onExpansionChanged: (bool isExpanded) {
            setState(() {
              isExpand = isExpanded;
            });
          },
          trailing: const SizedBox(),
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          initiallyExpanded: isExpand,
          title: Row(
            children: [
              isExpand
                  ? const Icon(Icons.keyboard_arrow_up)
                  : const Icon(Icons.keyboard_arrow_down),
              isExpand
                  ? const Text(
                      'Masquer les transactions',
                      style: kSmallText,
                    )
                  : const Text(
                      'Voir les transactions',
                      style: kSmallText,
                    ),
            ],
          ),
          children: <Widget>[
            TransactionCard(),
            TransactionCard(),
            TransactionCard(),
            SizedBox(
              height: kVerticalPadding,
            ),
          ],
        ),
      ],
    );
  }
}
