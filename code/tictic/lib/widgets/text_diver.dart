import 'package:flutter/material.dart';
import 'package:tictic/widgets/line_text.dart';

import '../style/spacings.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: vPadding * 2),
      child: Row(
        children: [
          LineText(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            child: Text('Ou',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )),
          ),
          LineText(),
        ],
      ),
    );
  }
}
