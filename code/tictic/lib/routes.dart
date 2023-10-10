import 'package:flutter/material.dart';
import 'package:tictic/models/team.dart';
import 'package:tictic/screens/home_screen.dart';
import 'package:tictic/screens/login_screen.dart';
import 'package:tictic/screens/register_screen.dart';
import 'package:tictic/screens/team_screen.dart';
import 'package:tictic/screens/welcome_screen.dart';

Map<String, WidgetBuilder> router = {
  HomeScreen.routeName: (context) => HomeScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  TeamScreen.routeName: (context) => TeamScreen(
        team: ModalRoute.of(context)?.settings.arguments as Team,
      ),
};
