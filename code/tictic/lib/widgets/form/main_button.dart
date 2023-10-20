import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/others.dart';
import '../../styles/spacings.dart';

@immutable
class MainButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isSeedColor;

  const MainButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isSeedColor = true});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    Future(widget.onPressed)
        .then((value) => setState(() => _isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoading ? null : _onSubmit,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: kVerticalPaddingS, horizontal: kHorizontalPadding),
        decoration: BoxDecoration(
          color: widget.isSeedColor ? kMainColor : kTertiaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            kShadow,
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _isLoading
                ? Padding(
                    padding: const EdgeInsets.only(right: kHorizontalPaddingS),
                    child: SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color:
                            widget.isSeedColor ? kBackgroundColor : kMainColor,
                      ),
                    ),
                  )
                : Container(),
            Text(
              widget.text,
              style: TextStyle(
                  color: widget.isSeedColor ? kBackgroundColor : kMainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
