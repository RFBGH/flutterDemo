import 'dart:developer';

import 'package:flutter/material.dart';

Future<String> getResult1() async{

  return Future.delayed(Duration(milliseconds: 300), (){
    return "result1";
  });
}

Future<int> getResult2() async{

  return Future.delayed(Duration(milliseconds: 500), (){
    return 1;
  });
}

Future<String> getResult3() async{
  return Future.delayed(Duration(milliseconds: 600), (){
    return "result3";
  });
}

void test(){
  Future
      .wait([
        getResult1(), getResult2(), getResult3()
      ])
      .then((results) =>{
        for (var value in results) {
          log("$value ${value.runtimeType}")
        }
      });
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'paint demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('low price demo'),
        ),
        body: Column(
          children: [
            GestureDetector(
              child: Container(
                child: Text(
                  "test"
                ),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
                alignment: Alignment.center,
              ),
              onTap: (){
                test();
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}