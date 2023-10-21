import 'package:dto/user.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/form_template_screen.dart';
import 'package:tictic/screens/register_screen.dart';
import 'package:tictic/widgets/form/password_input.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../styles/font.dart';
import '../styles/spacings.dart';
import '../widgets/form/main_button.dart';
import 'home_screen.dart';

@immutable
class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  final _loginFormKey = GlobalKey<FormState>();
  String _email = fictiveUsers[0].email;
  String _password = "1234567890";

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
                  initialValue: _email,
                  hintText: 'exemple@mail.com',
                  labelText: 'Adresse mail',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une adresse mail';
                    } else if (!EmailValidator.validate(value)) {
                      return 'L’adresse mail n’est pas valide';
                    }
                    return null;
                  },
                ),
                PasswordInput(
                  initialValue: _password,
                  onChanged: (value) {
                    _password = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainButton(
                        onPressed: () => {
                              if (_loginFormKey.currentState != null &&
                                  _loginFormKey.currentState!.validate())
                                {
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _email, password: _password)
                                      .then((value) {
                                    Navigator.popAndPushNamed(
                                        context, HomeScreen.routeName);
                                  }).catchError((error) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          'Vos identifiants sont incorrects'),
                                    ));
                                  })
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
