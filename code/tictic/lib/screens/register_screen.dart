import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/form_template_screen.dart';
import 'package:tictic/screens/login_screen.dart';
import 'package:tictic/widgets/form/password_input.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../styles/font.dart';
import '../styles/spacings.dart';
import '../utils/validations.dart';
import '../widgets/form/main_button.dart';

@immutable
class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  final _registerFormKey = GlobalKey<FormState>();

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
                    initialValue: "Daniel",
                    validator: (value) {
                      return validateName(value, 'Prénom');
                    },
                    tooltipMessage: 'Votre prénom sera visible par vos amis'),
                TextInput(
                    prefixIcon: Icons.person,
                    hintText: 'Duchant',
                    labelText: 'Nom',
                    initialValue: "Schreurs",
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return validateName(value, 'Nom');
                    },
                    tooltipMessage: 'Votre nom permet d’éviter les homonymes'),
                const TextInput(
                  prefixIcon: Icons.mail,
                  hintText: 'exemple@mail.com',
                  labelText: 'Adresse mail',
                  initialValue: "daniel.schreurs@hotmail.com",
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                const PasswordInput(),
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
                                      email: "daniel.schreurs@hotmail.com",
                                      password: "1234567890");
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                showCloseIcon: true,
                                duration: const Duration(seconds: 10),
                                // TODO : translate
                                content: Text(e.message ?? 'Erreur inconnue'),
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
