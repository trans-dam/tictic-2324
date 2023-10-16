import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/sizes.dart';
import '../styles/spacings.dart';
import '../widgets/navigation/welcome_navigation.dart';
import '../widgets/slider/text_slider.dart';

@immutable
class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';

  const WelcomeScreen({super.key});

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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: kVerticalPaddingL, top: kVerticalPadding * 3),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => {
                        if (ModalRoute.of(context)?.settings.name !=
                            WelcomeScreen.routeName)
                          {
                            Navigator.popAndPushNamed(
                                context, WelcomeScreen.routeName)
                          }
                      },
                      child: SvgPicture.asset(
                        'assets/icons/logo.svg',
                        semanticsLabel: 'Logo TicTic',
                        height: MediaQuery.of(context).size.height *
                            kLogoRatioPercentage,
                      ),
                    ),
                    const SizedBox(height: kVerticalPaddingL),
                    const Expanded(child: TextSlider()),
                    const SizedBox(height: kVerticalPaddingL),
                    const WelcomeNavigation(),
                  ],
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
