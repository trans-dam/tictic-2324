import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tictic/routes.dart';
import 'package:tictic/screens/home_screen.dart';
import 'package:tictic/screens/welcome_screen.dart';
import 'package:tictic/styles/colors.dart';

import 'firebase_options.dart';

Future<void> main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setLanguageCode("fr");
  runApp(const MyApp());
}

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: routes,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? HomeScreen.routeName
          : WelcomeScreen.routeName,
    );
  }
}
