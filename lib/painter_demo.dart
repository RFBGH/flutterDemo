import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'paint demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('paint demo'),
        ),
        body: Signature(),
      ),
    );
  }
}

class SignaturePainter extends CustomPainter{

  final List<Offset> points;

  SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    print('draw point...');
    var paint = Paint()
      ..color = Colors.black45
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for(int i = 0; i < points.length-1; i++){
      if (points[i] != null && points[i + 1] != null){
        canvas.drawLine(points[i], points[i+1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SignaturePainter oldDelegate) {
    return oldDelegate.points != points;
  }
}

class Signature extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SignatureState();
  }

}

class SignatureState extends State<Signature>{

  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details){
        print('onPanUpdate...0');
        setState(() {
          print('onPanUpdate...1');
          RenderBox renderBox = context.findRenderObject();
          Offset localPostion = renderBox.globalToLocal(details.globalPosition);
          points = new List.from(points)..add(localPostion);
        });
      },
      onPanDown: (DragDownDetails e){
        print("用户手指按下：${e.globalPosition}");
      },
      onPanEnd: (DragEndDetails e){
        points.add(null);
        print(e.velocity);
      },
      child: CustomPaint(
        painter: SignaturePainter(
            points,
        ),
        size: Size.infinite,
      ),
    );
  }

}