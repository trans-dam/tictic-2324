import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictic/screens/welcome_screen.dart';

import '../styles/colors.dart';
import '../styles/others.dart';
import '../styles/sizes.dart';
import '../styles/spacings.dart';

@immutable
class WelcomeScreenTemplate extends StatefulWidget {
  final Widget flexibleContent;
  final Widget shrinkContent;
  final bool isFirstScreen;

  const WelcomeScreenTemplate(
      {super.key,
      required this.flexibleContent,
      required this.shrinkContent,
      this.isFirstScreen = false});

  @override
  State<WelcomeScreenTemplate> createState() => _WelcomeScreenTemplateState();
}

class _WelcomeScreenTemplateState extends State<WelcomeScreenTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/back1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                if (!widget.isFirstScreen)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: kHorizontalPadding, top: kVerticalPadding),
                    child: GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kVerticalPaddingS,
                            horizontal: kHorizontalPaddingS),
                        decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            border: Border.all(
                                color: kTertiaryColor, width: kBorderWidth),
                            boxShadow: [kShadow]),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  )
                else
                  Container(),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: kVerticalPaddingL, top: kVerticalPadding * 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
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
                      widget.flexibleContent,
                      widget.shrinkContent,
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
