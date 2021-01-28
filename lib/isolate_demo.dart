import 'dart:isolate';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoadState();
  }
}

class LoadState extends State<MyApp>{

  List<dynamic> result = null;

  static void dataLoader(SendPort sendPort) async{

    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    await for(var msg in receivePort){
      SendPort sendPort = msg[0];
      String url = msg[1];
      http.Response response = await http.get(url);
      sendPort.send(json.decode(response.body));
    }
  }

  void loadData() async{

    ReceivePort receivePort = ReceivePort();

    Isolate.spawn(dataLoader, receivePort.sendPort);

    ReceivePort respone = ReceivePort();
    SendPort sendPort = await receivePort.first;
    sendPort.send([respone.sendPort, 'https://jsonplaceholder.typicode.com/posts']);

    List<dynamic> temp = await respone.first;

    setState(() {
      result = temp;
    });
  }

  Widget getBody(){

    if(result == null){
      return Center(child: new CircularProgressIndicator());
    }

    return ListView.builder(
      itemBuilder: (BuildContext context, int index){

        Map item = result[index];
        String s = '''
          id:${item['id']}
          title:${item['title']}
        ''';
        return Text(s, maxLines: 5,);
      },
      itemCount: result.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'isolate demo',
      home: Scaffold(
        body:getBody(),
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