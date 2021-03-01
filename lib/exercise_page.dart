import 'package:flutter/material.dart';
import 'package:flutter_hello/exercise_book_widget.dart';
import 'package:flutter_hello/exercise_page_item.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {

  ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "exercise page demo",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("exercise page demo"),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody(){
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            child: ExerciseBook(0),
            margin: EdgeInsets.only(bottom: 52, top: 20),
          ),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext ctx, int index){
                  return ExercisePageItem(pageIndex: index);
                },
              childCount: 40
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 36,
              childAspectRatio: 1,
            )
        ),
      ],
    );

  }
}
