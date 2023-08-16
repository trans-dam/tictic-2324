import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/spacings.dart';

class WelcomeScreenTemplate extends StatefulWidget {
  final Widget flexibleContent;
  final Widget shrinkContent;

  const WelcomeScreenTemplate(
      {super.key, required this.flexibleContent, required this.shrinkContent});

  @override
  State<WelcomeScreenTemplate> createState() => _WelcomeScreenTemplateState();
}

class _WelcomeScreenTemplateState extends State<WelcomeScreenTemplate> {
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
            padding: const EdgeInsets.symmetric(vertical: vPadding * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/logo.svg',
                  semanticsLabel: 'Logo TicTic',
                  height: MediaQuery.of(context).size.height * 0.16,
                ),
                Flexible(flex: 1, child: widget.flexibleContent),
                widget.shrinkContent,
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
