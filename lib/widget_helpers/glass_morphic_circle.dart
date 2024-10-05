import 'package:flutter/material.dart';
import 'dart:ui';

class GlassmorphicCircleArrow extends StatelessWidget {
  final double size;
  final Color arrowColor;
  final Color borderColor;
  final Color glassColor;

  const GlassmorphicCircleArrow({
    super.key,
    this.size = 200,
    this.arrowColor = Colors.red,
    this.borderColor = Colors.white,
    this.glassColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: glassColor.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: glassColor.withOpacity(0.2),
              border: Border.all(
                color: borderColor.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_downward,
                color: arrowColor,
                size: size * 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}