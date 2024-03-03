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



    for (var drawingRectangle in drawingRectangles) {
      final paintRectangle = Paint();
      paintRectangle.color = drawingRectangle.strokeColor;
      paintRectangle.isAntiAlias = true;
      paintRectangle.strokeWidth = drawingRectangle.strokeWidth;
      paintRectangle.strokeCap = StrokeCap.round;
      paintRectangle.style = PaintingStyle.stroke;

      Rect rectangle = Rect.fromPoints(drawingRectangle.leftTop!, drawingRectangle.rightBottom!);
      canvas.drawRect(rectangle, paintRectangle);

    }

    for (var drawingCircle in drawingCircles) {
      final paintCircle = Paint();
      paintCircle.color = drawingCircle.strokeColor;
      paintCircle.isAntiAlias = true;
      paintCircle.strokeWidth = drawingCircle.strokeWidth;
      paintCircle.strokeCap = StrokeCap.round;
      paintCircle.style = PaintingStyle.stroke;

      canvas.drawCircle(drawingCircle.centre!, drawingCircle.radius, paintCircle);
    }

    for (var drawingLine in drawingLines) {
      final paintLine = Paint();
      paintLine.color = drawingLine.strokeColor;
      paintLine.isAntiAlias = true;
      paintLine.strokeWidth = drawingLine.strokeWidth;
      paintLine.strokeCap = StrokeCap.round;

      canvas.drawLine(drawingLine.start!, drawingLine.end!, paintLine);
    }

    for (var drawingPoint in drawingPoints) {
      final paint = Paint();
      paint.color = drawingPoint.strokeColor;
      paint.isAntiAlias = true;
      paint.strokeWidth = drawingPoint.strokeWidth;
      paint.strokeCap = StrokeCap.round;

      for (var i = 0; i < drawingPoint.offsets.length; i++) {
        var lastOffset = i == drawingPoint.offsets.length - 1;

        if (lastOffset) {
          // No point drawn
        } else {
          final start = drawingPoint.offsets[i];
          final end = drawingPoint.offsets[i+1];
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