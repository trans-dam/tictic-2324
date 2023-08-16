import 'package:flutter/material.dart';
import 'package:tictic/routes.dart';
import 'package:tictic/style/colors.dart';

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
      routes: router,
    );
  }
}
