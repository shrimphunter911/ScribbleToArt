import 'package:flutter/material.dart';

class DrawingPoint{
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