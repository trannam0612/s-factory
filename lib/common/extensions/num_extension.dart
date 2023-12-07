import 'package:flutter/material.dart';

extension IntExtension on int? {
  int isCountLine({
    required String value,
    required double fontSize,
    required double lineHeight,
    required double containerWidth,
  }) {
    TextPainter painter = TextPainter(
      text: TextSpan(
        text: value,
        style: TextStyle(fontSize: fontSize, height: lineHeight),
      ),
      maxLines: 999, // Số lớn để đảm bảo tính toán đúng
      textDirection: TextDirection.ltr,
    );

    painter.layout(maxWidth: containerWidth);
    return painter.computeLineMetrics().length;
  }
}

extension IntTimeExtension on int? {
  String formatTime() {
    int minutes = (this ?? 0) ~/ 60;
    int seconds = ((this ?? 0) % 60);
    return "${minutes.toString().padLeft(2, "0")}.${seconds.toString().padLeft(2, "0")}";
    // return '${(Duration(seconds: this ?? 0))}'.split('.')[0].padLeft(8, '0');
  }
}
