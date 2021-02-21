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

            return Column(
              children: [
                Text(_counter.value.toString()),
                Text(_counter.value1.toString())
              ],
            );
          },
        ),
        floatingActionButton:FloatingActionButton(
          tooltip: 'Fade1',
          child: Column(
            children: [
              IconButton(icon: Icon(Icons.add), onPressed: (){
                _counter.increment();
              }),
              IconButton(icon: Icon(Icons.brush), onPressed: (){
                _counter.increment1();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

