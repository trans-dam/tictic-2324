import 'package:flutter/material.dart';

import '../style/colors.dart';

class LineText extends StatelessWidget {
  const LineText({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
          height: 1,
          decoration: const BoxDecoration(
            color: kMainColor,
          )),
    );
  }
}
