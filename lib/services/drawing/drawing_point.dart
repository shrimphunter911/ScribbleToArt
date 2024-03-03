import 'package:flutter/material.dart';

// Stroke Class
class DrawingPoint {
  int drawingId;
  List<Offset> offsets;
  Color strokeColor;
  double strokeWidth;

  DrawingPoint({
    this.drawingId = -1,
    this.offsets = const [],
    this.strokeColor = Colors.black,
    this.strokeWidth = 2.0,
  });

  DrawingPoint copyWith({List<Offset>? offsets}) {
    return DrawingPoint(
      drawingId: drawingId,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      offsets: offsets ?? this.offsets,
    );
  }
}

class DrawingCircle {
  int drawingId;
  Offset? centre;
  double radius;
  Color strokeColor;
  double strokeWidth;

  DrawingCircle({
    this.drawingId = -1,
    this.centre,
    this.radius = 0,
    this.strokeColor = Colors.black,
    this.strokeWidth = 2.0,
  });

  void updateRadius(double rad) {
    radius = rad;
  }
}

class DrawingRectangle {
  int drawingId;
  Offset? leftTop;
  Offset? rightBottom;
  Color strokeColor;
  double strokeWidth;

  DrawingRectangle({
    this.drawingId = -1,
    this.leftTop,
    this.rightBottom,
    this.strokeColor = Colors.black,
    this.strokeWidth = 2.0,
  });

  void updateRadius(Offset newEdge) {
    rightBottom = newEdge;
  }
}

class DrawingLine {
  int drawingId;
  Offset? start;
  Offset? end;
  Color strokeColor;
  double strokeWidth;

  DrawingLine({
    this.drawingId = -1,
    this.start,
    this.end,
    this.strokeWidth = 2.0,
    this.strokeColor = Colors.black,
  });

  void updateEnd(Offset newEnd) {
    end = newEnd;
  }
}
