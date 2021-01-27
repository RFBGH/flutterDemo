import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyNewHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyNewHomeState();
  }
}

Future<Response> getNews() async{
  await Future.delayed(
      Duration(seconds: 2),
          (){
            print('delay 2 seconds');
          }
      );

  String url = "http://v.juhe.cn/toutiao/index";
  String key = "4c52313fc9247e5b4176aed5ddd56ad7";
  String type = "keji";

  print('start request');
  var reponse = await Dio().get(url, queryParameters: {"type":type, "key":key});
  print('request over');
  return reponse;
}

class MyNewHomeState extends State<MyNewHome>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("My News"),
      ),
      body: FutureBuilder(
        future: getNews(),
        builder: (BuildContext context, AsyncSnapshot<Response> snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data.toString());
          }else if(snapshot.hasError){
            return Text("something is wrong ${snapshot.error.toString()}");
          }else{
            return Text("loading");
          }
        }
      ),
    );
  }
}