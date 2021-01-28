import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {

  static const jumpPlugin = const MethodChannel('com.jzhu.jump/plugin');
  
  void jumpOneAct() async{
    String result = await jumpPlugin.invokeMethod('oneAct');
    print(result);
  }

  void jumpTwoAct() async{
    Map<String, String> params = {'flutter':'flypig'};
    String result = await jumpPlugin.invokeMethod('twoAct', params);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("android demo"),
        ),
        body:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: jumpOneAct,
                icon: Icon(Icons.label),
              ),
              IconButton(
                onPressed: jumpTwoAct,
                icon: Icon(Icons.add),
              ),
              Counter(),
            ],
          ),
        ),
      ),
    );
  }
}


class Counter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }
  
}

class CounterState extends State<Counter>{
  
  static const counterPlugin = EventChannel('com.jzhu.counter/plugin');

  StreamSubscription subscription;

  Object event;

  @override
  Widget build(BuildContext context) {
    if(event == null){
      return Text('null data');
    }
    return Text('$event');
  }

  void onEvent(Object event){
    setState(() {
      this.event = event;
    });
  }

  @override
  void initState() {
    super.initState();

    subscription = counterPlugin.receiveBroadcastStream().listen(onEvent);
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }
}