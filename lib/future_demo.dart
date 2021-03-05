import 'dart:developer';

import 'package:flutter/material.dart';

int currentTimeMillis() {
  return new DateTime.now().millisecondsSinceEpoch;
}

Future<String> getResult1() async{

  return Future.delayed(Duration(milliseconds: 300), (){
    return "result1";
  });
}

Future<int> getResult2() async{

  return Future.delayed(Duration(milliseconds: 2000), (){
    return 1;
  });
}

Future<String> getResult3() async{
  return Future.delayed(Duration(milliseconds: 2000), (){
    return "result3";
  });
}

Future getResult() async{
  await Future.delayed(Duration(seconds: 4), (){
    return 1;
  });
}

void testWait() async{
  int start = currentTimeMillis();
  await Future.wait([getResult1(), getResult2(), getResult3(), getResult()]);
  log("cost ${currentTimeMillis()-start}");
}

void test(){

  // testWait();

  List<int> l1 = [1,2,3];
  List<int> l2 = [1,2,3];
  log("${l1 == l2}");

  // int start = currentTimeMillis();
  // Future
  //     .wait([
  //       getResult1(), getResult2(), getResult3()
  //     ])
  //     .onError((error, stackTrace){
  //       log("$error ${error.runtimeType}", stackTrace: stackTrace);
  //
  //       return Future((){
  //         return null;
  //       });
  //     })
  //     .then((results){
  //
  //       if(results == null){
  //         log("result is null");
  //         return;
  //       }
  //
  //       log("cost ${currentTimeMillis()-start}");
  //       for (var value in results) {
  //         log("$value ${value.runtimeType}");
  //       }
  //     });
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