import 'package:flutter/material.dart';
import 'package:tictic/models/team.dart';
import 'package:tictic/style/font.dart';
import 'package:tictic/style/spacings.dart';

import 'TransactionCard.dart';
import 'team_card.dart';

class TeamOverview extends StatefulWidget {
  final Team team;

  const TeamOverview({
    super.key,
    required this.team,
  });

  @override
  State<TeamOverview> createState() => _TeamOverviewState();
}

class _TeamOverviewState extends State<TeamOverview> {
  bool isExpand = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TeamCard(team: widget.team),
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
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: kVerticalPaddingL),
                child: Column(
                  children: widget.team.transactions
                          ?.sublist(0, 3)
                          .map((transaction) => TransactionCard(
                                transaction: transaction,
                              ))
                          .toList() ??
                      [],
                ),
              )
            ]),
      ],
    );
  }
}
