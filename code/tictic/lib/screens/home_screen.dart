import 'package:flutter/material.dart';
import 'package:tictic/partials/navigation/home_header.dart';
import 'package:tictic/partials/team/team_overview.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/style/font.dart';

import '../models/team.dart';
import '../partials/navigation/sidebar.dart';
import '../partials/slider/info_slider.dart';
import '../style/spacings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final items = [
    'Total à payer',
    'Total à recevoir',
    'Dernière transaction',
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
            HomeHeader(
              icon: Icons.menu,
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              picturePath: 'assets/img/dog.png',
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
            const SizedBox(
              height: kVerticalPadding,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Text('Vos groupes', style: kSectionTitle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding, vertical: kVerticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: teams.map((e) {
                  return TeamOverview(team: e);
                }).toList(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
