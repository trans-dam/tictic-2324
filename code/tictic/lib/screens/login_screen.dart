import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome_template_screen.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../style/spacings.dart';
import '../widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreenTemplate(
      flexibleContent: Padding(
        padding: const EdgeInsets.symmetric(horizontal: hPadding * 2),
        child: Form(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextInput(
              prefixIcon: Icons.mail,
              hintText: 'exemple@mail.com',
              labelText: 'Adresse mail'),
          const TextInput(
            prefixIcon: Icons.password,
            hintText: '******',
            labelText: 'Mot de passe',
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainButton(
                  onPressed: () => {debugPrint('Se connecter')},
                  text: 'Je me connecte'),
            ],
          ),
        ],
      ),
    ),
    ),
    shrinkContent: const Text('Login')
    ,
    );
  }
}
