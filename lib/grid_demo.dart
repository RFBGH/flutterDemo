import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      title: "grid demo",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid Demo"),
        ),
        body: _createGrid(),
      ),
      
    );

  }

  List<Widget> getChildrent(){
    return List<Widget>.generate(30, (index){
      return Image.asset('images/lake.jpg');
    });
  }
  
  Widget _createGrid(){

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder:(context, index){
          return Image.asset('images/lake.jpg');
        }
    );

    // return GridView.extent(
    //   maxCrossAxisExtent: 150.0,
    //   padding: const EdgeInsets.all(4.0),
    //   mainAxisSpacing: 4.0,
    //   crossAxisSpacing: 4.0,
    //   children: getChildrent(),
    // );
  }
}