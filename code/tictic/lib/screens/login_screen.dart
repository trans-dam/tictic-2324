import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/form_template_screen.dart';
import 'package:tictic/screens/home_screen.dart';
import 'package:tictic/screens/register_screen.dart';
import 'package:tictic/widgets/form/password_input.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../styles/font.dart';
import '../styles/spacings.dart';
import '../widgets/form/main_button.dart';

@immutable
class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  final _loginFormKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeScreenTemplate(
        flexibleContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInput(
                  prefixIcon: Icons.mail,
                  hintText: 'exemple@mail.com',
                  labelText: 'Adresse mail',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une adresse mail';
                    } else if (!EmailValidator.validate(value)) {
                      return 'L’adresse mail n’est pas valide';
                    }
                    return null;
                  },
                ),
                const PasswordInput(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainButton(
                        onPressed: () => {
                              if (_loginFormKey.currentState != null &&
                                  _loginFormKey.currentState!.validate())
                                {
                                  Navigator.popAndPushNamed(
                                      context, HomeScreen.routeName)
                                }
                            },
                        text: 'Je me connecte'),
                  ],
                ),
              ],
            ),
          ),
        ),
        shrinkContent: TextButton(
            onPressed: () =>
                {Navigator.pushNamed(context, RegisterScreen.routeName)},
            child: const Text(
              'Je n’ai pas encore de compte.\n\nCréer mon compte !',
              textAlign: TextAlign.center,
              style: kButtonTextStyle,
            )));
  }
}
