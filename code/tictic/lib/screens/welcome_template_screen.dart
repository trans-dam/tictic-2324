import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictic/style/colors.dart';

import '../style/others.dart';
import '../style/spacings.dart';

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
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/back1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                !widget.isFirstScreen
                    ? Padding(
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
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: kTertiaryColor, width: 2),
                                boxShadow: [kShadow]),
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: kVerticalPaddingL, top: kVerticalPadding * 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/logo.svg',
                        semanticsLabel: 'Logo TicTic',
                        height: MediaQuery.of(context).size.height * 0.16,
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
