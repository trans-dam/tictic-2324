import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/font.dart';
import '../../styles/others.dart';
import '../../styles/spacings.dart';

@immutable
class TextInput extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final String? tooltipMessage;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final FormFieldValidator<String> validator;

  const TextInput({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.labelText,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.tooltipMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: kHorizontalPadding),
            child: tooltipMessage != null
                ? Tooltip(
                    message: tooltipMessage,
                    child: Row(
                      children: [
                        Text(
                          labelText,
                          style: kLabelStyle,
                        ),
                        const Icon(
                          Icons.info_outline,
                          color: kMainColor,
                          size: kInfoIconSize,
                        )
                      ],
                    ),
                  )
                : Text(
                    labelText,
                    style: kLabelStyle,
                  )),
        TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding, vertical: kVerticalPadding),
            // TODO : add border radius
            prefixIcon: Container(child: Icon(prefixIcon)),
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
            ),
            filled: true,
            fillColor: kBackgroundColor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            errorStyle: kErrorStyle,
            hintStyle: kHintStyle,
          ),
        ),
        const SizedBox(
          height: kVerticalPadding,
        )
      ],
    );
  }
}
