import 'package:expense_tracker/helper/custom_navigation.dart';
import 'package:flutter/material.dart';

class Go {
  static void to(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void animateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(
      CustomPageRoute(page: page),
    );
  }

  static void back(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void replace(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void removeAndGo(BuildContext context, Widget targetWidget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => targetWidget),
      (Route<dynamic> route) => false,
    );
  }
}
