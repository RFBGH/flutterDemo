import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ani demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        body: DragTest(),
      ),
    );
  }
}

class DragTest extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return DragTestState();
  }

}

class DragTestState extends State<DragTest>{

  double top = 0.0;
  double left = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top:top,
            left: left,
            child: GestureDetector(

              child: CircleAvatar(
                child: Text(
                    'drag test',
                    textAlign: TextAlign.center
                ),
                radius: 50.0,
              ),

              onPanDown: (DragDownDetails e){
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e){
                setState(() {
                  left += e.delta.dx;
                  top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e){
                print(e.velocity);
              },
            )),
      ],
    );
  }

}