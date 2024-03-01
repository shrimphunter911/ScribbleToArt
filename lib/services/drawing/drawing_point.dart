import 'package:flutter/material.dart';

class DrawingPoint{
  int drawingId;
  List<Offset> offsets;
  Color color;
  double strokeWidth;

  DrawingPoint({
    this.drawingId = -1,
    this.offsets = const [],
    this.color = Colors.black,
    this.strokeWidth = 2.0,
  });

  DrawingPoint copyWith({List<Offset>? offsets}) {
    return DrawingPoint(
      drawingId: drawingId,
      color: color,
      strokeWidth: strokeWidth,
      offsets: offsets ?? this.offsets,
    );
  }

}