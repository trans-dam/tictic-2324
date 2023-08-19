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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: PageController(viewportFraction: 0.3, initialPage: 0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            index == 0
                ? const SizedBox(
                    width: kHorizontalPaddingL,
                  )
                : Container(),
            Container(
              padding: const EdgeInsets.only(right: kHorizontalPadding),
              decoration: BoxDecoration(
                color: kBackgroundColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 170,
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    items[index],
                    textAlign: TextAlign.right,
                    style: kTextSideBar,
                  ),
                  const SizedBox(
                    height: kVerticalPadding,
                  ),
                  const Text(
                    '80€',
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
    );
  }
}
