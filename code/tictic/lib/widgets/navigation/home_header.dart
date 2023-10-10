import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/colors.dart';
import '../../styles/others.dart';
import '../../styles/sizes.dart';
import '../../styles/spacings.dart';

@immutable
class HomeHeader extends StatelessWidget {
  final String? picturePath;
  final IconData icon;
  final GestureTapCallback? onTap;
  final bool small;

  const HomeHeader({
    required this.icon,
    required this.onTap,
    this.picturePath,
    this.small = false,
    super.key,
  });

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
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        border: Border.all(
                            color: kTertiaryColor, width: kBorderWidth),
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
              width: small ? kProfileSizeSmall : kProfileSize,
              height: small ? kProfileSizeSmall : kProfileSize,
            ),
          ),
        ),
      ],
    );
  }
}
