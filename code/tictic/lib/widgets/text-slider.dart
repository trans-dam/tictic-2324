import 'package:flutter/material.dart';

import '../style/font.dart';
import '../style/spacings.dart';
import 'line-item.dart';

class TextSlider extends StatelessWidget {
  const TextSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('L’harmonie financière dans vos groupes, en toute simplicité !',
            textAlign: TextAlign.center, style: italicText),
        SizedBox(
          height: vPadding * 1.5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LineItem(
                isActivated: true,
              ),
              LineItem(),
              LineItem(),
              LineItem(),
            ],
          ),
        )
      ],
    );
  }
}
