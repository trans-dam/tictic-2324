import 'dart:math';

import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/font.dart';
import '../../styles/spacings.dart';

@immutable
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
                // TODO : replace with value..
                width: MediaQuery.of(context).size.width > 390 ? 160 : 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index],
                      style: kTextSideBar,
                    ),
                    Text(
                      '${Random().nextInt(1000)}€',
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
