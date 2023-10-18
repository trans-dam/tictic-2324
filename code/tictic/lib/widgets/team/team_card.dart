import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tictic/models/team.dart';
import 'package:tictic/widgets/team/member_count.dart';
import 'package:tictic/widgets/team/tags.dart';

import '../../styles/font.dart';
import '../../styles/others.dart';
import '../../styles/spacings.dart';

@immutable
class TeamCard extends StatelessWidget {
  final Team team;

  const TeamCard({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kVerticalPadding, horizontal: kHorizontalPadding),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [kShadow]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 1,
                  child: Text(
                    team.title,
                    style: kTextSideBar.copyWith(height: 1),
                  )),
              Text(
                '${team.getSum()}€',
                style: kTextSideBarLight,
              ),
            ],
          ),
          const SizedBox(
            height: kVerticalPadding,
          ),
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  team.picturePath ?? 'assets/img/dog.png',
                  width: 48,
                  height: 48,
                ),
              ),
              const SizedBox(
                width: kHorizontalPadding,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Tags(tags: team.tags),
                          ),
                        ),
                        const SizedBox(
                          width: kHorizontalPaddingS,
                        ),
                        Text(
                          '${Random().nextInt(100)}€',
                          style: kTitleSideBar.copyWith(height: 1),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: kVerticalPaddingS),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MemberCount(
                            count: team.users.length + 1,
                          ),
                          Text(
                            "Depuis le ${DateFormat.yMd('fr').format(team.startDate)}",
                            style: kSmallText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
