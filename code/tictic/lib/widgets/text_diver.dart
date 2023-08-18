import 'package:flutter/material.dart';
import 'package:tictic/widgets/line_text.dart';

import '../style/font.dart';
import '../style/spacings.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: kVerticalPadding * 2),
      child: Row(
        children: [
          LineText(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Text('Ou',
                textAlign: TextAlign.center,
                style: kTextDiverStyle),
          ),
          LineText(),
        ],
      ),
    );
  }
}
