import 'package:flutter/material.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/style/others.dart';
import 'package:tictic/style/spacings.dart';

class LineItem extends StatelessWidget {
  final isActivated;
  final double width;

  LineItem({super.key, this.isActivated = false, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: vPadding*2),
      child: Container(
          height: 3,
          width: width,
          decoration: BoxDecoration(
            color: isActivated ? seedColor : backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              shadow,
            ],
          )),
    );
  }
}
