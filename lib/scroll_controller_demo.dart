import 'package:flutter/material.dart';

import 'exercise_book_widget.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _controller;
  bool _isShowBackTopMenu = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      bool showBackTopMenu = _controller.offset > 200;
      if (showBackTopMenu != _isShowBackTopMenu) {
        _isShowBackTopMenu = showBackTopMenu;
        setState(() {});
      }
    });
  }

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
        floatingActionButton: _isShowBackTopMenu
            ? FloatingActionButton(onPressed: () {
                _controller.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.ease);
              })
            : null,
      ),
    );
  }

  Widget getBody() {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 24, bottom: 24, left: 19, right: 19),
            child: Text(
              "已自动为你收藏拍照检查的练习册",
              style: TextStyle(fontSize: 12, color: Color(0x80000000)),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return ExerciseBook();
                  },
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
