import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/style/font.dart';

import '../style/others.dart';
import '../style/spacings.dart';
import '../widgets/sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<
        ScaffoldState>(); // Il nous faut une référence à notre Scaffold pour pouvoir ouvrir le drawer
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackgroundColor,
      drawer:  const Sidebar(),
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
            const Center(
              child: Text('Home Screen'),
            ),
          ],
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
