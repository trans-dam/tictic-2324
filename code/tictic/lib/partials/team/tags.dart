import 'package:flutter/material.dart';

import '../../style/font.dart';

class Tags extends StatelessWidget {
  const Tags({
    super.key,
    required this.tags,
  });

  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    return Text(
      '#${tags?.join('#') ?? 'Tictic'}',
      style: kHintStyle,
    );
  }
}
