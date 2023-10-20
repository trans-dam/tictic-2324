import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/form_template_screen.dart';
import 'package:tictic/screens/home_screen.dart';
import 'package:tictic/screens/login_screen.dart';
import 'package:tictic/widgets/form/password_input.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../styles/font.dart';
import '../styles/spacings.dart';
import '../utils/validations.dart';
import '../widgets/form/main_button.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  final _registerFormKey = GlobalKey<FormState>();

  String _firstName = "Daniel";
  String _lastName = "Schreurs";
  String _email = "daniel.schreurs@hotmail.com";
  String _password = "1234567890";

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeScreenTemplate(
        flexibleContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            key: _registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInput(
                    prefixIcon: Icons.person,
                    hintText: 'Alex',
                    labelText: 'Prénom',
                    keyboardType: TextInputType.name,
                    initialValue: _firstName,
                    onChanged: (value) {
                      _firstName = value;
                    },
                    validator: (value) {
                      return validateName(value, 'Prénom');
                    },
                    tooltipMessage: 'Votre prénom sera visible par vos amis'),
                TextInput(
                    prefixIcon: Icons.person,
                    hintText: 'Duchant',
                    labelText: 'Nom',
                    initialValue: _lastName,
                    onChanged: (value) {
                      _lastName = value;
                    },
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return validateName(value, 'Nom');
                    },
                    tooltipMessage: 'Votre nom permet d’éviter les homonymes'),
                TextInput(
                  prefixIcon: Icons.mail,
                  hintText: 'exemple@mail.com',
                  labelText: 'Adresse mail',
                  initialValue: _email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: validateEmail,
                ),
                PasswordInput(
                  onChanged: (value) {
                    _password = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainButton(
                        onPressed: () async {
                          if (_registerFormKey.currentState != null &&
                              _registerFormKey.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _email, password: _password)
                                  .then((value) => {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(_email)
                                            .set({
                                          'firstName': _firstName,
                                          'lastName': _lastName,
                                          'email': _email,
                                        }).then((value) => {
                                                  Navigator.pushNamed(context,
                                                      HomeScreen.routeName)
                                                })
                                      });
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                showCloseIcon: true,
                                duration: const Duration(seconds: 10),
                                // TODO : translate
                                content: Text(e.code ?? 'Erreur inconnue'),
                              ));
                            }
                          }
                        },
                        text: 'Créer mon compte'),
                  ],
                ),
              ],
            ),
          ),
        ),
        shrinkContent: TextButton(
          onPressed: () =>
              {Navigator.pushNamed(context, LoginScreen.routeName)},
          child: const Text('J’ai déjà un compte.\n\nJe me connecte !',
              textAlign: TextAlign.center, style: kButtonTextStyle),
        ));
  }
}
