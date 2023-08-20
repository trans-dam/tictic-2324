import 'package:flutter/material.dart';
import 'package:tictic/models/group.dart';
import 'package:tictic/style/font.dart';

import '../style/spacings.dart';
import 'TransactionCard.dart';
import 'group_card.dart';

class GroupWidget extends StatefulWidget {
  final Group group;

  const GroupWidget({
    super.key,
    required this.group,
  });

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  bool isExpand = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupCard(group: widget.group),
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
          children: const <Widget>[
            TransactionCard(),
            TransactionCard(),
            TransactionCard(),
            SizedBox(
              height: kVerticalPaddingXL,
            ),
          ],
        ),
      ],
    );
  }
}
