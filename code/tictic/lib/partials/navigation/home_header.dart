import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/colors.dart';
import '../../style/font.dart';
import '../../style/others.dart';
import '../../style/spacings.dart';

class HomeHeader extends StatelessWidget {
  final String? picturePath;
  final IconData icon;
  final GestureTapCallback? onTap;

  const HomeHeader(
      {required this.icon, required this.onTap, this.picturePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding, vertical: kVerticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: kVerticalPaddingS,
                        horizontal: kHorizontalPaddingS),
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kTertiaryColor, width: 2),
                        boxShadow: [kShadow]),
                    child: Icon(icon)),
              ),
              SvgPicture.asset(
                'assets/icons/logo.svg',
                semanticsLabel: 'Logo TicTic',
                height: kLogoSize,
              ),
            ],
          ),
        ),
        Center(
          child: ClipOval(
            child: Image.asset(
              picturePath ?? 'assets/img/dog.png',
              fit: BoxFit.cover,
              width: 108,
              height: 108,
            ),
          ),
        ),
      ],
    );
  }
}
