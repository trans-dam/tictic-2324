import 'package:flutter/material.dart';
import 'package:tictic/models/team.dart';
import 'package:tictic/partials/team/transactions_list.dart';
import 'package:tictic/routes.dart';

import 'team_card.dart';

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
        Navigator.pushNamed(context, kTeamRoute, arguments: team);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TeamCard(team: team),
          team.transactions != null
              ? TransactionList(transactions: team.transactions!)
              : const SizedBox(),
        ],
      ),
    );
  }
}
