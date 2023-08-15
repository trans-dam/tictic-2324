import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/spacings.dart';
import '../widgets/main_button.dart';
import '../widgets/text-diver.dart';
import '../widgets/text-slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/back1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: hPadding * 2, vertical: vPadding * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/logo.svg',
                  semanticsLabel: 'Logo TicTic',
                  height: MediaQuery.of(context).size.height * 0.16,
                ),
                const Flexible(flex: 1, child: TextSlider()),
                MainButton(
                    onPressed: () => {debugPrint('Continuer sans compte')},
                    text: 'Continuer sans compte'),
                const TextDivider(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainButton(
                        onPressed: () => {debugPrint('Je me connecte')},
                        text: 'Je me connecte',
                        isSeedColor: false,
                      ),
                      SizedBox(
                        width: hPadding,
                      ),
                      MainButton(
                        onPressed: () => {debugPrint('Créer mon compte')},
                        text: 'Créer mon compte',
                        isSeedColor: false,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}