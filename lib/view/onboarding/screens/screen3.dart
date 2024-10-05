import 'package:expense_tracker/widget_helpers/animated_widget.dart';
import 'package:expense_tracker/widget_helpers/gradient_icons.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  String message = '''Let us start by a basic intro''';
  @override
  Widget build(BuildContext context) {
    return FadeInWidget(
      child: gradientText(message),
    );
  }
}
