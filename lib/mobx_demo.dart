import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'counter.dart';

class MyApp extends StatelessWidget{

  final _counter = Counter();

  @override
  Widget build(BuildContext context) {

    autorun((_){
      print(_counter.value);
    });

    return MaterialApp(
      title: 'ani demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("mobx demo"),
        ),
        body: Observer(
          builder: (ctx){
            return Text(_counter.value.toString());
          },
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Fade',
          child: Icon(Icons.brush),
          onPressed: (){
            _counter.increment();
          },
        ),
      ),
    );
  }
}

