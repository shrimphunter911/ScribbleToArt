import 'dart:typed_data';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scribbletoart/services/drawing/drawing_point.dart';
import 'dart:ui' as ui;
import 'package:scribbletoart/services/drawing/painter.dart';
import 'package:scribbletoart/utilities/colors.dart';
import 'package:scribbletoart/utilities/stroke_type.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
    ),
    home: const DrawingApp()
    ),
  );
}

class DrawingApp extends StatefulWidget {
  const DrawingApp({super.key});

  @override
  State<DrawingApp> createState() => _DrawingAppState();
}

class _DrawingAppState extends State<DrawingApp> {
  DrawingPoint? point;
  DrawingCircle? circle;
  DrawingRectangle? rectangle;
  DrawingLine? line;
  var drawingLines = <DrawingLine>[];
  var drawingCircles = <DrawingCircle>[];
  var drawingRectangles = <DrawingRectangle>[];
  var drawingPointsHistory = <DrawingPoint>[];
  var drawingPoints = <DrawingPoint>[];
  var strokeWidth = 2.0;
  var strokeColor = Colors.black;
  var strokeType = StrokeType.stroke;
  GlobalKey globalKey = GlobalKey();

  Future<void> save() async {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    if (!(await Permission.storage.status.isGranted)) {
      await Permission.storage.request();
    }

    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: 60,
        name: 'canvas_image'
    );

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(17, 16, 23, 100),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 40, 57, 100),
                    border: Border.all(
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    iconSize: 64,
                    color: Colors.pink,
                    icon: Image.asset('assets/imageIcons/pencil.png'),
                    onPressed: () {
                      setState(() {
                        strokeColor = Colors.black;
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 40, 57, 100),
                    border: Border.all(
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    iconSize: 64,
                    color: Colors.pink,
                    icon: Image.asset('assets/imageIcons/eraser.png'),
                    onPressed: () {
                      setState(() {
                        strokeType = StrokeType.stroke;
                        strokeColor = Colors.white;
                      });
                    },
                  ),
                ),
                const Text(
                  'Stroke Size:',
                  style: TextStyle(fontSize: 17, decoration: TextDecoration.none, fontFamily: 'Roboto', color: Colors.white),
                ),
                Card(
                  color: Color.fromRGBO(41, 40, 57, 100),
                  surfaceTintColor: Colors.blueGrey,
                  shadowColor: Colors.blueGrey,
                  child: Container(
                    width: 100,
                    height: 50,
                    child: Slider(
                      value: strokeWidth,
                      min: 1,
                      max: 25,
                      onChanged: (value) {
                        setState(() {
                          strokeWidth = value;
                        });
                      },
                    ),
                  ),
                ),
                const Text(
                  'Stroke Type:',
                  style: TextStyle(fontSize: 17, decoration: TextDecoration.none, fontFamily: 'Roboto', color: Colors.white),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 40, 57, 100),
                    border: Border.all(
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    iconSize: 64,
                    color: Colors.pink,
                    icon: SvgPicture.asset('assets/imageIcons/curve.svg', height: 50, width: 50,),
                    onPressed: () {
                      setState(() {
                        strokeType = StrokeType.stroke;
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 40, 57, 100),
                    border: Border.all(
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    iconSize: 64,
                    color: Colors.pink,
                    icon: SvgPicture.asset('assets/imageIcons/line.svg', height: 50, width: 50,),
                    onPressed: () {
                      setState(() {
                        strokeType = StrokeType.line;
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 40, 57, 100),
                    border: Border.all(
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    iconSize: 64,
                    color: Colors.pink,
                    icon: SvgPicture.asset('assets/imageIcons/circle.svg', height: 50, width: 50,),
                    onPressed: () {
                      setState(() {
                        strokeType = StrokeType.circle;
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 40, 57, 100),
                    border: Border.all(
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    iconSize: 64,
                    color: Colors.pink,
                    icon: SvgPicture.asset('assets/imageIcons/rectangle.svg', height: 50, width: 50,),
                    onPressed: () {
                      setState(() {
                        strokeType = StrokeType.rectangle;
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 40, 57, 100),
                    border: Border.all(
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    iconSize: 64,
                    color: Colors.pink,
                    icon: SvgPicture.asset('assets/imageIcons/triangle.svg', height: 50, width: 50,),
                    onPressed: () {

                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 40, 57, 100),
                    border: Border.all(
                      width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    iconSize: 64,
                    color: Colors.pink,
                    icon: SvgPicture.asset('assets/imageIcons/triangle_clarity.svg', height: 50, width: 50,),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Color.fromRGBO(220, 220, 228, 100),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.count(
                              crossAxisCount: 8,
                              children: [
                                Card(
                                  color: Color.fromRGBO(13, 14, 33, 100),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      if(drawingPoints.isNotEmpty && drawingPointsHistory.isNotEmpty) {
                                        setState(() {
                                          drawingPoints.removeLast();
                                        });
                                      }
                                    },
                                    title: Text('Undo', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                                    trailing: Icon(Icons.undo, color: Colors.white,),
                                  ),
                                ),
                                Card(
                                  color: const Color.fromRGBO(13, 14, 33, 100),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      if (drawingPoints.length < drawingPointsHistory.length) {
                                        final index = drawingPoints.length;
                                        setState(() {
                                          drawingPoints.add(drawingPointsHistory[index]);
                                        });
                                      }
                                    },
                                    title: Text('Redo', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                                    trailing: Icon(Icons.redo, color: Colors.white,),
                                  ),
                                ),
                                Card(
                                  color: const Color.fromRGBO(13, 14, 33, 100),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        drawingPoints.clear();
                                        drawingCircles.clear();
                                        drawingRectangles.clear();
                                        drawingLines.clear();
                                      });
                                    },
                                    title: Text('Clear', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                                    trailing: Icon(Icons.clear, color: Colors.white,),
                                  ),
                                ),
                                Material(
                                  color: Color.fromRGBO(220, 220, 228, 100),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [Color.fromRGBO(83, 0, 170, 100), Color.fromRGBO(172, 0, 76, 100)]
                                      )
                                    ),
                                    child: ListTile(
                                      onTap: () {

                                      },
                                      title: Text('Lock', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                                      trailing: Icon(Icons.lock_open_outlined, color: Colors.white,),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                        Card(
                          color: Color.fromRGBO(140, 0, 110, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                save();
                              });
                            },
                            child: const Text('Download', style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Scaffold(
                        backgroundColor: const Color.fromRGBO(220, 220, 228, 0),
                        body: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                              width: 5,
                              color: Color.fromRGBO(140, 101, 255, 100),
                            )
                          ),
                          child: GestureDetector(
                            onPanStart: (details) {
                              switch (strokeType) {
                                case StrokeType.line:
                                  setState(() {
                                    line = DrawingLine(
                                      drawingId: DateTime.now().millisecondsSinceEpoch,
                                      start: details.localPosition,
                                      end: details.localPosition,
                                      strokeWidth: strokeWidth,
                                      strokeColor: strokeColor,
                                    );

                                    if (line == null) return;
                                    drawingLines.add(line!);
                                  });
                                case StrokeType.circle:
                                  setState(() {
                                    // Creating circle object
                                    circle = DrawingCircle(
                                      drawingId: DateTime.now().millisecondsSinceEpoch,
                                      centre: details.localPosition,
                                      strokeColor: strokeColor,
                                      strokeWidth: strokeWidth,
                                    );

                                    if (circle == null) return;
                                    drawingCircles.add(circle!);

                                  });

                                case StrokeType.rectangle:
                                  setState(() {
                                    rectangle = DrawingRectangle(
                                      drawingId: DateTime.now().millisecondsSinceEpoch,
                                      leftTop: details.localPosition,
                                      rightBottom: details.localPosition,
                                      strokeColor: strokeColor,
                                      strokeWidth: strokeWidth,
                                    );

                                    if (rectangle == null) return;
                                    drawingRectangles.add(rectangle!);
                                  });

                                case StrokeType.stroke:
                                default:
                                  setState(() {
                                    point = DrawingPoint(
                                      drawingId: DateTime.now().millisecondsSinceEpoch,
                                      offsets: [details.localPosition],
                                      strokeColor: strokeColor,
                                      strokeWidth: strokeWidth,
                                    );

                                    if (point == null) return;
                                    drawingPoints.add(point!);
                                    drawingPointsHistory = List.of(drawingPoints);
                                  });
                              }
                             },
                            onPanUpdate: (details) {
                              switch (strokeType) {
                                case StrokeType.line:
                                  setState(() {
                                    if (line == null) return;
                                    Offset end = details.localPosition;
                                    line?.updateEnd(end);
                                    drawingLines.last = line!;
                                  });
                                case StrokeType.circle:
                                  setState(() {
                                    if (circle == null) return;
                                    Offset? centre = circle?.centre;
                                    Offset vector = details.localPosition;
                                    double rad = (centre! - vector).distance;
                                    circle!.updateRadius(rad);
                                    drawingCircles.last = circle!;

                                  });

                                case StrokeType.rectangle:
                                  setState(() {
                                    if (rectangle == null) return;
                                    Offset bottomRight = details.localPosition;
                                    rectangle?.updateRadius(bottomRight);
                                    drawingRectangles.last = rectangle!;
                                  });

                                case StrokeType.stroke:
                                default:
                                  setState(() {
                                    if (point == null) return;

                                    point = point?.copyWith(
                                        offsets: point!.offsets
                                          ..add(details.localPosition)
                                    );
                                    drawingPoints.last = point!;
                                    drawingPointsHistory = List.of(drawingPoints);
                                  });
                              }
                            },
                            onPanEnd: (_) {
                              point = null;
                              circle = null;
                              rectangle = null;
                              line = null;
                            },
                            child: ClipRect(
                              child: RepaintBoundary(
                                key: globalKey,
                                child: CustomPaint(
                                  painter: Painter(drawingPoints: drawingPoints,
                                    drawingCircles: drawingCircles,
                                    drawingRectangles: drawingRectangles,
                                    drawingLines: drawingLines,
                                  ),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        floatingActionButton: Builder(builder: (context) {
                          return FloatingActionButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            child: const Icon(Icons.color_lens_outlined),
                          );
                        }),
                        endDrawer: Container(
                          width: 100,
                          child: Drawer(
                            child: ListView.builder(
                              itemCount: colors.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        strokeColor = colors[index];
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    tileColor: colors[index],
                                    shape: const CircleBorder(),
                                  ),
                                );
                              },
                            )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}