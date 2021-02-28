import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'counter.dart';
import 'name.dart';

class MyApp extends StatelessWidget{

  final _counter = Counter();
  final _name = Name();

  int _addCount = 0;

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
                Text(_counter.value.toString()+" $_addCount"),
                Text(_counter.value1.toString()),
                MyStatelessWidget(),
                Observer(builder: (context){
                  return Text(_name.name);
                }),
                Text(_name.name),
                IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
                  _name.setName("newName ${_addCount}");
                  _addCount++;
                })
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

class MyStatelessWidget extends StatelessWidget{

  static int _count = 0;

  @override
  Widget build(BuildContext context) {
    _count++;
    return Text("$_count");
  }
  
}