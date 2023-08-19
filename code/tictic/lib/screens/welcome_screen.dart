import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome_template_screen.dart';

import '../routes.dart';
import '../style/spacings.dart';
import '../partials/form/main_button.dart';
import '../partials/form/text_diver.dart';
import '../partials/slider/text_slider.dart';

class WelcomeScreen extends StatefulWidget {
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
                onPressed: () => {Navigator.pushNamed(context, kHomeRoute)},
                text: 'Continuer sans compte'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:kHorizontalPadding),
              child: TextDivider(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, kLoginRoute)},
                    text: 'Je me connecte',
                    isSeedColor: false,
                  ),
                  const SizedBox(
                    width: kHorizontalPadding,
                  ),
                  MainButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, kRegisterRoute)},
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
