import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome_template_screen.dart';
import 'package:tictic/widgets/form/password_input.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../routes.dart';
import '../style/font.dart';
import '../style/spacings.dart';
import '../widgets/main_button.dart';

class RegisterScreen extends StatefulWidget {
  final _registerFormKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreenTemplate(
        flexibleContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding * 2),
          child: Form(
            key: widget._registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInput(
                  prefixIcon: Icons.person,
                  hintText: 'Alex',
                  labelText: 'Prénom',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre prénom';
                    }
                    return null;
                  },
                  tooltipMessage: 'Votre prénom sera visible par vos amis'
                ),
                TextInput(
                  prefixIcon: Icons.person,
                  hintText: 'Duchant',
                  labelText: 'Nom',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre prénom';
                    }
                    return null;
                  },
                    tooltipMessage: 'Votre nom permet d’éviter les homonymes'
                ),
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
                              if (widget._registerFormKey.currentState !=
                                      null &&
                                  widget._registerFormKey.currentState!
                                      .validate())
                                {Navigator.popAndPushNamed(context, kHomeRoute)}
                            },
                        text: 'Créer mon compte'),
                  ],
                ),
              ],
            ),
          ),
        ),
        shrinkContent: TextButton(
          onPressed: () => {Navigator.pushNamed(context, kLoginRoute)},
          child: const Text(
            'J’ai déjà un compte.\n\nJe me connecte !',
            textAlign: TextAlign.center,
            style: kButtonTextStyle
          ),
        ));
  }
}
