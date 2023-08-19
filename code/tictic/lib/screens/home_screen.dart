import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/style/font.dart';

import '../partials/group_card.dart';
import '../style/others.dart';
import '../style/spacings.dart';
import '../partials/slider/info_slider.dart';
import '../partials/navigation/sidebar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final items = [
    'Total à payer',
    'Total à recevoir',
    'Total',
  ];

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<
        ScaffoldState>(); // Il nous faut une référence à notre Scaffold pour pouvoir ouvrir le drawer
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackgroundColor,
      drawer: const Sidebar(),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding, vertical: kVerticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kVerticalPaddingS,
                            horizontal: kHorizontalPaddingS),
                        decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: kTertiaryColor, width: 2),
                            boxShadow: [kShadow]),
                        child: const Icon(Icons.menu)),
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
              child: Image.asset(
                'assets/img/dog.png',
                fit: BoxFit.cover,
                width: 108,
                height: 108,
              ),
            ),
            const SizedBox(
              height: kVerticalPaddingL,
            ),
            const Padding(
              padding: EdgeInsets.only(left: kHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hey, Daniel !',
                    style: kTitleHome,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: kHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'On vous doit de l’argent 👌',
                    style: kTagLine,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kVerticalPadding,
            ),
            InfoSlider(items: items),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding, vertical: kVerticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: kVerticalPaddingS),
                    child: Text('Vos groupes', style: kSectionTitle),
                  ),
                  GroupCard(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
