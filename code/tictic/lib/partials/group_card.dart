import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tictic/models/group.dart';

import '../style/font.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class GroupCard extends StatelessWidget {
  final Group group;

  const GroupCard({
    super.key,
    required this.group,
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
                    group.title,
                    style: kTextSideBar.copyWith(height: 1),
                  )),
              Text(
                '${Random().nextInt(1000)}€',
                style: kTextSideBarLight,
              ),
            ],
          ),
          const SizedBox(
            height: kVerticalPadding,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img/groupe-1.png',
                width: 48,
                height: 48,
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
                            child: Text(
                              group.tags?.join('#') ?? '',
                              style: kHintStyle,
                            ),
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
                      padding: EdgeInsets.only(top: kVerticalPaddingS),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${group.users.length} participants',
                            style: kSmallText,
                          ),
                          Text(
                            DateFormat.yMMMEd().format(group.startDate),
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
