import 'package:flutter/material.dart';
import 'package:tictic/screens/home_screen.dart';
import 'package:tictic/widgets/navigation/menu_item.dart';

import '../../styles/colors.dart';
import '../../styles/font.dart';
import '../../styles/spacings.dart';

@immutable
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
              'Actions rapides 🧳',
              style: kTitleSideBar,
            ),
            const SizedBox(
              height: kVerticalPaddingL,
            ),
            MenuItem(
              icon: Icons.settings,
              title: 'Réglages',
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            MenuItem(
              icon: Icons.groups,
              title: 'Créer un groupe',
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            MenuItem(
              icon: Icons.group_add,
              title: 'Inviter une personne',
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            MenuItem(
              icon: Icons.receipt_long,
              title: 'Ajouter une transaction',
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            MenuItem(
              icon: Icons.logout,
              title: 'Je me déconnecte',
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
