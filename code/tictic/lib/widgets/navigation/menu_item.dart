import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/font.dart';
import '../../styles/spacings.dart';

@immutable
class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback onTap;

  const MenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kVerticalPaddingL),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.all(kVerticalPaddingS),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kVerticalPaddingS),
                    color: kMainColor),
                child: Icon(
                  icon,
                  color: kBackgroundColor,
                )),
            const SizedBox(
              width: kHorizontalPadding,
            ),
            Text(
              title,
              style: kTextSideBar,
            )
          ],
        ),
      ),
    );
  }
}
