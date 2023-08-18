import 'package:flutter/material.dart';
import 'package:tictic/widgets/form/text_input.dart';

import '../../style/colors.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;
  IconData _suffixIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      prefixIcon: Icons.password,
      hintText: '******',
      labelText: 'Mot de passe',
      obscureText: _isObscure,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le mot de passe ne peut pas être vide';
        } else if (value.length < 9) {
          return 'Le mot de passe doit contenir au moins 8 caractères';
        }
        return null;
      },
      suffixIcon: GestureDetector(
        child: Icon(_suffixIcon, color: kMainColor),
        onTap: () {
          setState(() {
            _isObscure = !_isObscure;
            if (_isObscure) {
              _suffixIcon = Icons.visibility_off;
            } else {
              _suffixIcon = Icons.visibility;
            }
          });
        },
      ),
    );
  }
}
