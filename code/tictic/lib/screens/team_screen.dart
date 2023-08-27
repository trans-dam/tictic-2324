import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tictic/partials/navigation/home_header.dart';
import 'package:tictic/partials/team/member_count.dart';
import 'package:tictic/style/colors.dart';

import '../models/team.dart';
import '../partials/navigation/sidebar.dart';
import '../partials/team/big_stat.dart';
import '../partials/team/tags.dart';
import '../style/font.dart';
import '../style/spacings.dart';

class TeamScreen extends StatelessWidget {
  final Team team;

  const TeamScreen({required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: const Sidebar(),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeHeader(
              icon: Icons.arrow_back,
              onTap: () {
                Navigator.pop(context);
              },
              picturePath: team.picturePath,
            ),
            const SizedBox(
              height: kVerticalPaddingL,
            ),
            Text(
              team.title,
              style: kTextSideBar,
            ),
            const SizedBox(
              height: kVerticalPaddingS,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MemberCount(count: team.users.length + 1),
                const SizedBox(
                  width: kHorizontalPadding,
                ),
                Text(
                  // TODO : replace 'fr' by a variable
                  "Depuis le ${DateFormat.yMMMMd('fr').format(team.startDate)}",
                  style: kSmallText,
                ),
              ],
            ),
            const SizedBox(
              height: kVerticalPaddingS,
            ),
            Tags(tags: team.tags),
            const SizedBox(
              height: kVerticalPaddingL,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigStat(label: 'Total à payer', value: team.getSum()),
                const SizedBox(
                  width: kHorizontalPadding,
                ),
                BigStat(
                    label: 'Total en cours',
                    value: Random().nextInt(100).toDouble()),
              ],
            )
          ],
        ),
      )),
    );
  }
}
