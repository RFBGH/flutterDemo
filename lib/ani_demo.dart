import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ani demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyFadeTest('ani demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget{

  String title;

  MyFadeTest(this.title);

  @override
  State<StatefulWidget> createState() {
    return MyFadeState();
  }
}

class MyFadeState extends State<MyFadeTest> with TickerProviderStateMixin{

  AnimationController controller;
  CurvedAnimation curve;
  
  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('ani demo')
      ),
      body: Center(
        child: Container(
          child: RotationTransition(
            turns: curve,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: (){
          controller.reset();
          controller.forward();
        },
      ),
    );
  }
}