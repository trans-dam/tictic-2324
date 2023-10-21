import 'package:flutter/material.dart';

import '../../styles/font.dart';

@immutable
class Tags extends StatelessWidget {
  const Tags({
    super.key,
    required this.tags,
  });

  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    return tags != null && tags!.isNotEmpty
        ? Text(
            '#${tags?.join('#') ?? 'Tictic'}',
            style: kHintStyle,
          )
        : const SizedBox();
  }
}
