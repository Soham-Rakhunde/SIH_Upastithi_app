import 'package:flutter/material.dart';

class QrScanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final unit = size.width / 6;
    final side = 4 * unit;
    final len = 0.25 * side;
    final center = size / 2;

    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 9.0
      ..strokeCap = StrokeCap.round;

    var bgPaint = Paint()
      ..color = Colors.black.withOpacity(0.8)
      ..strokeWidth = 9.0
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, center.height - side/2)
      ..lineTo(size.width - unit, center.height - side/2)
      ..lineTo(size.width - unit, center.height + side/2)
      ..lineTo(unit, center.height + side/2)
      ..lineTo(unit, center.height - side/2)
      ..lineTo(0, center.height - side/2)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, bgPaint);

    canvas.drawLine(Offset(unit, center.height - (side / 2 - len)),
        Offset(unit, center.height - side / 2), paint);
    canvas.drawLine(Offset(unit + len, center.height - side / 2),
        Offset(unit, center.height - side / 2), paint);

    canvas.drawLine(Offset(size.width - unit, center.height - (side / 2 - len)),
        Offset(size.width - unit, center.height - side / 2), paint);
    canvas.drawLine(Offset(size.width - unit, center.height - side / 2),
        Offset(size.width - unit - len, center.height - side / 2), paint);

    canvas.drawLine(Offset(size.width - unit, center.height + (side / 2 - len)),
        Offset(size.width - unit, center.height + side / 2), paint);
    canvas.drawLine(Offset(size.width - unit, center.height + side / 2),
        Offset(size.width - unit - len, center.height + side / 2), paint);


    canvas.drawLine(Offset(unit, center.height + (side / 2 - len)),
        Offset(unit, center.height + side / 2), paint);
    canvas.drawLine(Offset(unit + len, center.height + side / 2),
        Offset(unit, center.height + side / 2), paint);


    final TextPainter textPainter = TextPainter(
        text: const TextSpan(text: 'Scan QR Code\nto confirm Attendance', style: TextStyle(
          fontSize: 18,
        ),),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    )
      ..layout(maxWidth: size.width - 12.0 - 12.0);
    textPainter.paint(canvas, Offset(0.55*center.width, center.height + side/2 +unit));

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
