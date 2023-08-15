import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/widgets/main_button.dart';
import 'package:tictic/style/spacings.dart';
import 'package:tictic/widgets/text-diver.dart';
import 'package:tictic/widgets/text-slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          secondary: secondaryColor,
          tertiary: tertiaryColor,
          background: backgroundColor,
          error: errorColor,
        ),
        useMaterial3: true,
        fontFamily: 'Avenir Next',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            padding: const EdgeInsets.symmetric(horizontal: hPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/logo.svg',
                  semanticsLabel: 'Logo TicTic',
                  width: 150,
                ),
                const SizedBox(
                  height: vPadding * 9,
                ),
                const TextSlider(),
                const SizedBox(
                  height: vPadding * 9,
                ),
                MainButton(
                    onPressed: () => {debugPrint('Continuer sans compte')},
                    text: 'Continuer sans compte'),
                const SizedBox(
                  height: vPadding * 2,
                ),
                const TextDivider(),
                const SizedBox(
                  height: vPadding * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainButton(
                      onPressed: () => {debugPrint('Je me connecte')},
                      text: 'Je me connecte',
                      isSeedColor: false,
                    ),
                    MainButton(
                      onPressed: () => {debugPrint('Créer mon compte')},
                      text: 'Créer mon compte',
                      isSeedColor: false,
                    )
                  ],
                ),
                const SizedBox(
                  height: vPadding * 2,
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
