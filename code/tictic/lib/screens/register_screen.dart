import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome_template_screen.dart';
import 'package:tictic/widgets/form/password_input.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../routes.dart';
import '../style/font.dart';
import '../style/spacings.dart';
import '../utils/validations.dart';
import '../widgets/form/main_button.dart';

@immutable
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
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            key: widget._registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInput(
                    prefixIcon: Icons.person,
                    hintText: 'Alex',
                    labelText: 'Prénom',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return validateName(value, 'Prénom');
                    },
                    tooltipMessage: 'Votre prénom sera visible par vos amis'),
                TextInput(
                    prefixIcon: Icons.person,
                    hintText: 'Duchant',
                    labelText: 'Nom',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return validateName(value, 'Nom');
                    },
                    tooltipMessage: 'Votre nom permet d’éviter les homonymes'),
                const TextInput(
                  prefixIcon: Icons.mail,
                  hintText: 'exemple@mail.com',
                  labelText: 'Adresse mail',
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
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
          child: const Text('J’ai déjà un compte.\n\nJe me connecte !',
              textAlign: TextAlign.center, style: kButtonTextStyle),
        ));
  }
}
