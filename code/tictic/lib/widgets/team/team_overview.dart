import 'package:dto/team.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/team_screen.dart';
import 'package:tictic/styles/spacings.dart';
import 'package:tictic/widgets/team/transactions_list.dart';

import 'team_card.dart';

@immutable
class TeamOverview extends StatelessWidget {
  final Team team;

  const TeamOverview({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TeamScreen.routeName, arguments: team);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TeamCard(team: team),
          team.transactions != null && team.transactions!.isNotEmpty
              ? TransactionList(transactions: team.transactions!)
              : const SizedBox(
                  height: kVerticalPaddingXL,
                ),
        ],
      ),
    );
  }
}
