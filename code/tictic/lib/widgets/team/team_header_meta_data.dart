import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tictic/widgets/team/tags.dart';

import '../../style/font.dart';
import '../../style/spacings.dart';
import 'member_count.dart';

@immutable
class TeamHeaderMetaData extends StatelessWidget {
  final String title;
  final int userCount;
  final DateTime startDate;
  final List<String>? tags;

  const TeamHeaderMetaData({
    super.key,
    required this.title,
    required this.userCount,
    required this.startDate,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kVerticalPadding,
        ),
        Text(
          title,
          style: kTextSideBar,
        ),
        const SizedBox(
          height: kVerticalPaddingS,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MemberCount(count: userCount),
            const SizedBox(
              width: kHorizontalPadding,
            ),
            Text(
              // TODO : replace 'fr' by a variable
              "Depuis le ${DateFormat.yMMMMd('fr').format(startDate)}",
              style: kSmallText,
            ),
          ],
        ),
        const SizedBox(
          height: kVerticalPaddingS,
        ),
        Tags(tags: this.tags),
        const SizedBox(
          height: kVerticalPaddingL,
        ),
      ],
    );
  }
}
