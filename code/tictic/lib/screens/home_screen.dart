import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/style/font.dart';

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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPaddingL, vertical: kVerticalPadding),
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
            const SizedBox(
              height: kVerticalPaddingL,
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
              padding: EdgeInsets.only(left: kHorizontalPaddingL),
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
              padding: EdgeInsets.only(left: kHorizontalPaddingL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'On vous doit de l’argent 👌',
                    style: kSubTitleHome,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kVerticalPaddingL,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: kVerticalPadding),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/back-slider.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
              ),
              height: 150,
              child: InfoSlider(items: items),
            )
          ],
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
