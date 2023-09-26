import 'package:flutter/material.dart';

import '../../styles/font.dart';


@immutable
class MemberCount extends StatelessWidget {
  final int count;

  const MemberCount({
    required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count participants',
      style: kSmallText,
    );
  }
}
