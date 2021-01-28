import 'dart:isolate';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoadState();
  }
}

class LoadState extends State<MyApp>{

  String result = null;

  static void dataLoader(SendPort sendPort) async{

    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    await for(var msg in receivePort){
      SendPort sendPort = msg[0];
      String param = msg[1];
      sendPort.send('$param plus one');
    }
  }

  void loadData() async{

    ReceivePort receivePort = ReceivePort();

    Isolate.spawn(dataLoader, receivePort.sendPort);

    ReceivePort respone = ReceivePort();
    SendPort sendPort = await receivePort.first;
    sendPort.send([respone.sendPort, result]);

    String temp = await respone.first;

    setState(() {
      result = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'isolate demo',
      home: Scaffold(
        body: Center(
          child:Text(result == null ? "xxxx":result),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Fade',
          child: Icon(Icons.brush),
          onPressed: (){
            loadData();
          },
        ),
      ),
    );
  }

}