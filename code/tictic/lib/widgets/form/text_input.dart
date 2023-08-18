import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/spacings.dart';

class TextInput extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const TextInput(
      {super.key,
      required this.prefixIcon,
      required this.hintText,
      required this.labelText,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: hPadding),
          child: Text(
            labelText,
            style: const TextStyle(
                color: seedColor, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            filled: true,
            fillColor: backgroundColor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: vPadding,
        )
      ],
    );
  }
}