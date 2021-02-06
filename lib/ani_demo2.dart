import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{

  final aniDemo = AniDemo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ani demo'),
        ),
        body: aniDemo,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.forward),
          onPressed: (){
            aniDemo.replay();
          },
        ),
      ),
    );
  }
}

class AniDemo extends StatefulWidget {

  _AniDemoState state = _AniDemoState();

  void replay(){
    state._replay();
  }

  @override
  _AniDemoState createState(){
    return state;
  }
}

class _AniDemoState extends State<AniDemo> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Tween _opacityAni;
  Tween _scaleAni;
  CurvedAnimation _animation;

  void _replay(){
    _controller.reset();
    _controller.forward();
  }

  @override
  void initState() {
    _controller = AnimationController(duration:Duration(milliseconds: 500), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _opacityAni = Tween(begin: 0.0, end: 1.0);
    _scaleAni = Tween(begin: 0.0, end: 100.0);

    _animation.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Opacity(
          opacity: _opacityAni.evaluate(_animation),
          child: Container(
              width: _scaleAni.evaluate(_animation),
              height: _scaleAni.evaluate(_animation),
              child: Image.asset('images/lake.jpg')
          ),
        ),
      ),
    );
  }
}
