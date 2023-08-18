import 'package:flutter/material.dart';
import 'package:tictic/screens/login_screen.dart';
import 'package:tictic/screens/register_screen.dart';
import 'package:tictic/screens/welcome_screen.dart';

const String kLoginRoute = '/login';
const String kRegisterRoute = '/register';
const String kResetPasswordRoute = '/resetPassword';
const String kHomeRoute = '/';
const String kError = '/error';

Map<String, WidgetBuilder> router = {
  kHomeRoute: (context) => const WelcomeScreen(),
  kLoginRoute: (context) => LoginScreen(),
  kRegisterRoute: (context) => RegisterScreen(),
};
