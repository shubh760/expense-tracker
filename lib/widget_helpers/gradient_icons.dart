import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/widget_helpers/app_text.dart';
import 'package:flutter/material.dart';

Widget gradientIcon(IconData icon) {
  LinearGradient gradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: colors.gradientColor,
  );
  return ShaderMask(
    shaderCallback: (Rect bounds) => gradient.createShader(bounds),
    child: Icon(icon, color: Colors.white, size: 35.0),
  );
}
Widget gradientText(String text) {
  LinearGradient gradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: colors.gradientColor,
  );
  return ShaderMask(
    shaderCallback: (Rect bounds) => gradient.createShader(bounds),
    child: AppText(text: text, color: Colors.white, size: 35.0),
  );
}
