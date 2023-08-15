import 'package:flutter/material.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/style/others.dart';

class LineItem extends StatelessWidget {
  final isActivated;

  const LineItem({super.key, this.isActivated = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 3,
        width: 57,
        decoration: BoxDecoration(
          color: isActivated ? seedColor : backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            shadow,
          ],
        ));
  }
}
