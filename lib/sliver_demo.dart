

import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sliver demo",
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home: Scaffold(
        body: getBody(),
      ),
    );
  }

  Widget getBody(){

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: Icon(Icons.arrow_back_sharp),
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("头部区域下拉"),
            background: Image.asset("images/lake.jpg", fit: BoxFit.fill,),
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5
            ),
            delegate: SliverChildBuilderDelegate(
                (ctx, index){
                  return Container(
                    color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
                    child: Icon(Icons.favorite, color:Colors.white),
                  );
                },
              childCount: 7
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, index){
              return ListTile(
                leading: Text("$index 项目"),
                trailing: Icon(Icons.face),
              );
            },
            childCount: 14
          ),
        ),
      ],
    );

  }
}