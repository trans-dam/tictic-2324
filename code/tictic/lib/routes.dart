import 'package:flutter/material.dart';
import 'package:tictic/screens/home_screen.dart';
import 'package:tictic/screens/login_screen.dart';
import 'package:tictic/screens/register_screen.dart';
import 'package:tictic/screens/welcome_screen.dart';

const String kLoginRoute = '/login';
const String kRegisterRoute = '/register';
const String kResetPasswordRoute = '/resetPassword';
const String kHomeRoute = '/';
const String kWelcomeRoute = '/welcome';
const String kErrorRoute = '/error';
const String kSettingRoute = '/settings';
const String kAddGroupRoute = '/add_group';
const String kAddPersonRoute = '/add_person';
const String kAddTransactionRoute = '/add_transaction';

Map<String, WidgetBuilder> router = {
  kHomeRoute: (context) => HomeScreen(),
  kWelcomeRoute: (context) => const WelcomeScreen(),
  kLoginRoute: (context) => LoginScreen(),
  kRegisterRoute: (context) => RegisterScreen(),
};
