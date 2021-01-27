
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "stack demo",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("stack demo"),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody(){

    return Center(child:Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundImage: AssetImage('images/lake.jpg'),
            radius: 100.0,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child:Container(
            decoration: BoxDecoration(
              color: Colors.black45
            ),
            child: Text(
              'Mia B',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child:ElevatedButton(
            onPressed: (){
              Fluttertoast.showToast(msg: 'click here');
            },
            child: Text('center'),
          ),
        ),
      ],
    ));
  }

}