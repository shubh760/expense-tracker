import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradientTextField extends StatefulWidget {
  final LinearGradient textGradient;
  final double borderRadius;
  final Color borderColor;
  final TextEditingController controller;

  const GradientTextField({
    super.key,
    this.textGradient = const LinearGradient(
      colors: [Colors.purple, Colors.blue],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    this.borderRadius = 30.0,
    this.borderColor = Colors.grey,
    required this.controller,
  });

  @override
  State<GradientTextField> createState() => _GradientTextFieldState();
}

class _GradientTextFieldState extends State<GradientTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.borderColor),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            controller: widget.controller,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              foreground: Paint()
                ..shader = widget.textGradient
                    .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
            ),
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            onChanged: (value) {
              setState(() {}); // Trigger rebuild to update gradient
            },
          ),
          // This transparent TextField is used to handle the cursor and selection
          IgnorePointer(
            child: TextField(
              controller: widget.controller,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.transparent),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
