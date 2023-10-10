import 'package:flutter/material.dart';
import 'package:tictic/screens/home_screen.dart';
import 'package:tictic/screens/login_screen.dart';
import 'package:tictic/screens/register_screen.dart';
import 'package:tictic/screens/welcome_template_screen.dart';

import '../styles/spacings.dart';
import '../widgets/form/main_button.dart';
import '../widgets/form/text_diver.dart';
import '../widgets/slider/text_slider.dart';

@immutable
class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreenTemplate(
        isFirstScreen: true,
        flexibleContent: const TextSlider(),
        shrinkContent: Column(
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
                    onPressed: () => {
                      Navigator.pushNamed(context, RegisterScreen.routeName)
                    },
                    text: 'Créer mon compte',
                    isSeedColor: false,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
