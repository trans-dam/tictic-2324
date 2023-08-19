import 'package:flutter/material.dart';

import '../style/font.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kVerticalPadding, horizontal: kHorizontalPadding),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [kShadow]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 1,
                  child: Text(
                    'Voyage à Sainte-Maxime 🇫🇷🧳',
                    style: kTextSideBar.copyWith(height: 1),
                  )),
              const Text(
                '1200€',
                style: kTextSideBarLight,
              ),
            ],
          ),
          const SizedBox(
            height: kVerticalPadding,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img/groupe-1.png',
                width: 48,
                height: 48,
              ),
              const SizedBox(
                width: kHorizontalPadding,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '#Voyage#Vacance#Anciens',
                          style: kHintStyle,
                        ),
                        Text(
                          '80€',
                          style: kTitleSideBar.copyWith(height: 1),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: kVerticalPaddingS),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '6 participants',
                            style: kSmallText,
                          ),
                          Text(
                            'Depuis le 16 juillet 2023',
                            style: kSmallText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
