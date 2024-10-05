import 'package:expense_tracker/widget_helpers/animated_widget.dart';
import 'package:expense_tracker/widget_helpers/gradient_icons.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String message = '''No Worries! 
We will help you with your expenses''';
  @override
  Widget build(BuildContext context) {
    return FadeInWidget(
      child: gradientText(message),
    );
  }
}
