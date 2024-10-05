import 'package:flutter/material.dart';
import 'dart:math' as math;

class DirectionalArrow extends StatelessWidget {
  final int id;
  final double size;

  const DirectionalArrow({
    super.key,
    required this.id,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    final bool isIncoming = id == 0;
    final Color arrowColor = isIncoming ? Colors.green : Colors.red;

    return Transform.rotate(
      angle: isIncoming ? 0 : math.pi,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ArrowPainter(color: arrowColor),
      ),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  final Color color;

  _ArrowPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    final path = Path();

    // Starting point (top-right corner)
    path.moveTo(size.width, 0);

    // Line to bottom-right corner
    path.lineTo(size.width, size.height);

    // Curve to create arrow point
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.7,
      0,
      size.height * 0.5,
    );

    // Line back to starting point
    path.lineTo(size.width, 0);

    // Close the path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}