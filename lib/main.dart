import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
  var strokeWidth = 2.0;

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
                                    onTap: () {},
                                    title: Text('Undo', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                                    trailing: Icon(Icons.undo, color: Colors.white,),
                                  ),
                                ),
                                Card(
                                  color: Color.fromRGBO(13, 14, 33, 100),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                          
                                    },
                                    title: Text('Redo', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                                    trailing: Icon(Icons.redo, color: Colors.white,),
                                  ),
                                ),
                                Card(
                                  color: Color.fromRGBO(13, 14, 33, 100),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                          
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
                                      gradient: LinearGradient(
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
                          
                            },
                            child: Text('Download', style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            width: 5,
                            color: Color.fromRGBO(140, 101, 255, 100),
                          )
                        ),
                        child: CustomPaint(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
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


// backgroundColor: Theme.of(context).colorScheme.inversePrimary,