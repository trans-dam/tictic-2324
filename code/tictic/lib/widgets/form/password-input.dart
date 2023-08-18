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
      suffixIcon: GestureDetector(
        child: Icon(_suffixIcon, color: seedColor),
        onTap: () {
          setState(() {
            _isObscure = !_isObscure;
            if (_isObscure) {
              _suffixIcon = Icons.visibility_off;
            } else {
              _suffixIcon = Icons.visibility;
            }
          });
          debugPrint('tapped');
        },
      ),
    );
  }
}
