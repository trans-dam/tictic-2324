import 'package:flutter/cupertino.dart';

import '../styles/font.dart';

class HomeTitle extends StatelessWidget {
  final String text;

  const HomeTitle({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kTitleHome,
      textAlign: TextAlign.left,
    );
  }
}
