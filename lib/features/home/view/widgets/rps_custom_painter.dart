import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color(0xffDDCDFF)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
        Offset(size.width * 0.17, size.height * 1.00),
        Offset(size.width * 1.00, size.height * 0.00),
        [const Color(0xFFAE98DF), const Color.fromARGB(255, 221, 213, 238)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1, size.height * 0.0);
    path_0.lineTo(size.width * 1, size.height * 0.0);
    path_0.lineTo(size.width * 1.0025000, size.height * 0.9985714);
    path_0.quadraticBezierTo(size.width * 0.9825000, size.height * 0.7840714,
        size.width * 0.8291667, size.height * 0.6897143);
    path_0.cubicTo(
        size.width * 0.6902917,
        size.height * 0.6493571,
        size.width * 0.5235417,
        size.height * 0.6937857,
        size.width * 0.3990000,
        size.height * 0.5968571);
    path_0.cubicTo(
        size.width * 0.3145833,
        size.height * 0.4906429,
        size.width * 0.3594167,
        size.height * 0.3325000,
        size.width * 0.3800000,
        size.height * 0.2200000);
    path_0.quadraticBezierTo(size.width * 0.3955833, size.height * 0.0015000,
        size.width * 0.1650000, size.height * 0.0042857);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
