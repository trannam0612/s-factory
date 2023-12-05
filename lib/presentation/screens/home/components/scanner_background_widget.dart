import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_0_stroke.color = Color(0xff00AEEF).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.001945525, size.height * 0.002873563,
            size.width * 0.9961089, size.height * 0.9942529),
        paint_0_stroke);

    // Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawRect(
    //     Rect.fromLTWH(size.width * 0.001945525, size.height * 0.002873563,
    //         size.width * 0.9961089, size.height * 0.9942529),
    // paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.08171206, size.height * 0.02298851);
    path_1.lineTo(size.width * 0.01556420, size.height * 0.02298851);
    path_1.lineTo(size.width * 0.01556420, size.height * 0.1206897);

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02334630;
    paint_1_stroke.color = Color(0xff00AEEF).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_stroke);

    // Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    // paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9182879, size.height * 0.02298851);
    path_2.lineTo(size.width * 0.9844358, size.height * 0.02298851);
    path_2.lineTo(size.width * 0.9844358, size.height * 0.1206897);

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02334630;
    paint_2_stroke.color = Color(0xff00AEEF).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_stroke);

    // Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    // paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.08171206, size.height * 0.9770115);
    path_3.lineTo(size.width * 0.01556420, size.height * 0.9770115);
    path_3.lineTo(size.width * 0.01556420, size.height * 0.8793103);

    Paint paint_3_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02334630;
    paint_3_stroke.color = Color(0xff00AEEF).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_stroke);

    // Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    // paint_3_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.9182879, size.height * 0.9770115);
    path_4.lineTo(size.width * 0.9844358, size.height * 0.9770115);
    path_4.lineTo(size.width * 0.9844358, size.height * 0.8793103);

    Paint paint_4_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02334630;
    paint_4_stroke.color = Color(0xff00AEEF).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_stroke);

    // Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    // paint_4_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_4, paint_4_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
