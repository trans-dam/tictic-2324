import 'package:flutter/material.dart';
import 'package:tictic/routes.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/style/spacings.dart';
import 'package:tictic/partials/navigation/menu_item.dart';

import '../../style/font.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kVerticalPaddingL, horizontal: kHorizontalPadding),
        child: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Actions rapides',
              style: kTitleSideBar,
            ),
            const SizedBox(
              height: kVerticalPaddingL,
            ),
            MenuItem(
              icon: Icons.settings,
              title: 'Réglages',
              onTap: () {
                Navigator.pushNamed(context, kSettingRoute);
              },
            ),
            MenuItem(
              icon: Icons.groups,
              title: 'Créer un groupe',
              onTap: () {
                Navigator.pushNamed(context, kAddGroupRoute);
              },
            ),
            MenuItem(
              icon: Icons.group_add,
              title: 'Inviter une personne',
              onTap: () {
                Navigator.pushNamed(context, kAddPersonRoute);
              },
            ),
            MenuItem(
              icon: Icons.receipt_long,
              title: 'Ajouter une transaction',
              onTap: () {
                Navigator.pushNamed(context, kAddTransactionRoute);
              },
            ),
            MenuItem(
              icon: Icons.logout,
              title: 'Je me déconnecte',
              onTap: () {
                Navigator.pushNamed(context, kWelcomeRoute);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
