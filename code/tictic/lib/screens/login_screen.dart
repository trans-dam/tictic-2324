import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome_template_screen.dart';
import 'package:tictic/widgets/form/password-input.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../routes.dart';
import '../style/colors.dart';
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
                    labelText: 'Adresse mail',
                    keyboardType: TextInputType.emailAddress),
                const PasswordInput(),
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
        shrinkContent: TextButton(
          onPressed: () => {Navigator.popAndPushNamed(context, kRegisterRoute)},
          child: const Text(
            'Je n’ai pas encore de compte.\n\nCréer mon compte !',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 0.8,
                color: seedColor,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                fontSize: 20),
          ),
        ));
  }
}
