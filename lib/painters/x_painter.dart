// x_painter.dart
import 'package:flutter/material.dart';

class XPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey
          ..strokeWidth = 1.0
          ..style = PaintingStyle.stroke;

    // Draw first diagonal line (top-left to bottom-right)
    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);

    // Draw second diagonal line (top-right to bottom-left)
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
