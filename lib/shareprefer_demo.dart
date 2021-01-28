import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: new SharePrefer(),
    );
  }
}

class SharePrefer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SharePreferState();
  }
}

class SharePreferState extends State<SharePrefer>{

  void _increment() async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // int counter = (prefs.getInt('counter' ?? 0)) + 1;
    // print('Pressed $counter times');
    // prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: (){
          _increment();
        },
      ),
    );
  }

}