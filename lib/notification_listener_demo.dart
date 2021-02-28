import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isShowBackTopMenu = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "scroll controller demo",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("stack demo"),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {

    return NotificationListener(

      onNotification: (ScrollNotification notification){

        if(notification is ScrollStartNotification){

        }else if(notification is ScrollUpdateNotification){
        }else{

        }

        return false;
      },
      child: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text("label $index");
          },
          itemCount: 100,
        ),
      ),
    );
  }

}
