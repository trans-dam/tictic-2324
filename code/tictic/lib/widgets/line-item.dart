import 'package:flutter/material.dart';
import 'package:tictic/style/colors.dart';
import 'package:tictic/style/others.dart';

class LineItem extends StatelessWidget {
  final isActivated;
  final double width;

  LineItem({super.key, this.isActivated = false, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 3,
        width: width,
        decoration: BoxDecoration(
          color: isActivated ? seedColor : backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            shadow,
          ],
        ));
  }
}
