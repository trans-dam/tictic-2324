import 'dart:math';

import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/font.dart';
import '../../style/spacings.dart';

class InfoSlider extends StatelessWidget {
  const InfoSlider({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kVerticalPadding),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/back-slider.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
      ),
      height: 135,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: PageController(viewportFraction: 0.3, initialPage: 0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              index == 0
                  ? const SizedBox(
                      width: kHorizontalPadding,
                    )
                  : Container(),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPaddingS,
                    vertical: kVerticalPaddingS),
                decoration: BoxDecoration(
                  color: kBackgroundColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        items[index],
                        textAlign: TextAlign.right,
                        style: kTextSideBar,
                      ),
                    ),
                    const SizedBox(
                      height: kVerticalPadding,
                    ),
                    Text(
                      '${Random().nextInt(1000)}€',
                      textAlign: TextAlign.right,
                      style: kTitleHome,
                    ),
                  ],
                ),
              ),
              index < items.length
                  ? const SizedBox(
                      width: kHorizontalPadding,
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
