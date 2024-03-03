import 'package:flutter/material.dart';
import 'drawing_point.dart';

class Painter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;
  final List<DrawingCircle> drawingCircles;
  final List<DrawingRectangle> drawingRectangles;
  final List<DrawingLine> drawingLines;

  Painter({
    required this.drawingPoints,
    required this.drawingCircles,
    required this.drawingRectangles,
    required this.drawingLines,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundColor = Paint();
    backgroundColor.color = Colors.white;

    Rect rect = Rect.largest;
    canvas.drawRect(rect, backgroundColor);

    final paint = Paint();
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    // Drawing Rectangle
    for (var drawingRectangle in drawingRectangles) {
      paint.color = drawingRectangle.strokeColor;
      paint.strokeWidth = drawingRectangle.strokeWidth;

      Rect rectangle = Rect.fromPoints(
          drawingRectangle.leftTop!, drawingRectangle.rightBottom!);
      canvas.drawRect(rectangle, paint);
    }

    // Drawing Circles
    for (var drawingCircle in drawingCircles) {
      paint.color = drawingCircle.strokeColor;
      paint.strokeWidth = drawingCircle.strokeWidth;

      canvas.drawCircle(
          drawingCircle.centre!, drawingCircle.radius, paint);
    }

    // Drawing Lines
    for (var drawingLine in drawingLines) {
      paint.color = drawingLine.strokeColor;
      paint.strokeWidth = drawingLine.strokeWidth;

      canvas.drawLine(drawingLine.start!, drawingLine.end!, paint);
    }

    // Drawing Strokes
    for (var drawingPoint in drawingPoints) {
      paint.color = drawingPoint.strokeColor;
      paint.strokeWidth = drawingPoint.strokeWidth;


      for (var i = 0; i < drawingPoint.offsets.length; i++) {
        var lastOffset = i == drawingPoint.offsets.length - 1;

        if (lastOffset) {
          // No point drawn
        } else {
          final start = drawingPoint.offsets[i];
          final end = drawingPoint.offsets[i + 1];
          canvas.drawLine(start, end, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
