import 'package:flutter/material.dart';

import '../style/font.dart';
import '../style/spacings.dart';
import 'line-item.dart';

class TextSlider extends StatefulWidget {
  const TextSlider({super.key});

  @override
  State<TextSlider> createState() => _TextSliderState();
}

class _TextSliderState extends State<TextSlider> {
  final items = [
    'L’harmonie financière dans vos groupes, en toute simplicité !',
    'Calculs instantanés, équité garantie avec TicTic !',
    'Calculs fastidieux ? Non merci. Optez pour la simplicité avec TicTic !',
    'TicTic : Vos dépenses partagées en toute simplicité !',
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 60,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: PageController(viewportFraction: 1),
              itemCount: items.length,
              onPageChanged: (index) {
                setState(() {
                  _index = index;
                });
              },
              itemBuilder: (context, index) {
                return Text(
                  items[index],
                  textAlign: TextAlign.center,
                  style: italicText,
                );
              },
            )),
        const SizedBox(
          height: vPadding * 1.5,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((e) {
              var currentIndex = items.indexOf(e);
              return LineItem(
                width: MediaQuery.of(context).size.width / (2 * items.length),
                isActivated: currentIndex == _index,
              );
            }).toList())
      ],
    );
  }
}
