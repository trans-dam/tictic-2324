import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tictic/routes.dart';
import 'package:tictic/style/colors.dart';

void main() {
  initializeDateFormatting();
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
        dividerColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kMainColor,
          secondary: kSecondaryColor,
          tertiary: kTertiaryColor,
          background: kBackgroundColor,
          error: kErrorColor,
        ),
        useMaterial3: true,
        fontFamily: 'Avenir Next',
        listTileTheme: const ListTileThemeData(
          dense: true,
        ),
      ),
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        debugPrint(deviceLocale?.countryCode);
        debugPrint(deviceLocale?.languageCode);
      },
      routes: router,
    );
  }
}
