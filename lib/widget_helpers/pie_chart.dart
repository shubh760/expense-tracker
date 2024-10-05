/* import 'dart:math';
import 'package:flutter/material.dart';

class PieChartData {
  final double value;
  final Color color;

  PieChartData(this.value, this.color);
}

class PieChart3D extends StatelessWidget {
  final List<PieChartData> data;
  final double height;
  final double width;

  const PieChart3D({
    super.key,
    required this.data,
    this.height = 200,
    this.width = 200,
  }) : assert(data.length > 0, 'At least one data point is required');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CustomPaint(
        painter: PieChart3DPainter(data),
      ),
    );
  }
}

class PieChart3DPainter extends CustomPainter {
  final List<PieChartData> data;

  PieChart3DPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(centerX, centerY);
    final rect =
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);

    double total = data.map((d) => d.value).reduce((a, b) => a + b);
    double startAngle = -pi / 2;

    for (int i = 0; i < data.length; i++) {
      final sweepAngle = 2 * pi * (data[i].value / total);
      final endAngle = startAngle + sweepAngle;

      // Draw the side of the pie slice
      final sideStartX = centerX + radius * cos(startAngle);
      final sideStartY = centerY + radius * sin(startAngle);
      final sideEndX = centerX + radius * cos(endAngle);
      final sideEndY = centerY + radius * sin(endAngle);

      final sidePath = Path()
        ..moveTo(centerX, centerY + 20) // Move down to create 3D effect
        ..lineTo(sideStartX, sideStartY + 20)
        ..arcToPoint(
          Offset(sideEndX, sideEndY + 20),
          radius: Radius.circular(radius),
          clockwise: true,
        )
        ..lineTo(centerX, centerY + 20)
        ..close();

      canvas.drawPath(
          sidePath, Paint()..color = data[i].color.withOpacity(0.7));

      // Draw the top of the pie slice
      final topPath = Path()
        ..moveTo(centerX, centerY)
        ..lineTo(sideStartX, sideStartY)
        ..arcToPoint(
          Offset(sideEndX, sideEndY),
          radius: Radius.circular(radius),
          clockwise: true,
        )
        ..lineTo(centerX, centerY)
        ..close();

      canvas.drawPath(topPath, Paint()..color = data[i].color);

      startAngle = endAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Usage example
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pieChartData = [
      PieChartData(30, Colors.red),
      PieChartData(40, Colors.green),
      PieChartData(15, Colors.blue),
      PieChartData(15, Colors.yellow),
      PieChartData(20, Colors.purple), // Added a fifth value
    ];

    return Scaffold(
      appBar: AppBar(title: Text('3D Pie Chart')),
      body: Center(
        child: PieChart3D(
          data: pieChartData,
          height: 300,
          width: 300,
        ),
      ),
    );
  }
} */