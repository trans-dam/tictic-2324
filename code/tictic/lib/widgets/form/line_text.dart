import 'package:flutter/material.dart';

import '../../styles/colors.dart';

@immutable
class LineText extends StatelessWidget {
  const LineText({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(child: Container(height: 1, color: kMainColor));
  }
}
