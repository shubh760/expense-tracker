import 'package:expense_tracker/widget_helpers/animated_widget.dart';
import 'package:expense_tracker/widget_helpers/gradient_icons.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

String message = '''Hello there! 
Keeping track of expenses can be hard'''; 

  @override
  Widget build(BuildContext context) {
    return FadeInWidget(child: gradientText(message),);
  }
}