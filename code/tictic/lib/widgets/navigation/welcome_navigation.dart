import 'package:flutter/material.dart';

import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/register_screen.dart';
import '../../styles/spacings.dart';
import '../form/main_button.dart';
import '../form/text_diver.dart';

class WelcomeNavigation extends StatelessWidget {
  const WelcomeNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainButton(
            onPressed: () =>
                {Navigator.pushNamed(context, HomeScreen.routeName)},
            text: 'Continuer sans compte'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: TextDivider(),
        ),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, LoginScreen.routeName)},
                text: 'Je me connecte',
                isSeedColor: false,
              ),
              const SizedBox(
                width: kHorizontalPadding,
              ),
              MainButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, RegisterScreen.routeName)},
                text: 'Créer mon compte',
                isSeedColor: false,
              )
            ],
          ),
        )
      ],
    );
  }
}
