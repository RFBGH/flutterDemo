import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(primaryColor: Colors.white),
      home: new MyViewPage(),
    );
  }
}

class MyViewPage extends StatefulWidget {
  @override
  _MyViewPageState createState() => _MyViewPageState();
}

class _MyViewPageState extends State<MyViewPage> {
  int pageCount = 10;
  PageController _controller;
  _CurPage _currSelect;
  Timer timer;

  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();

    _currSelect = new _CurPage();
    _controller = PageController();
    // startTimer();
    initPage();
  }

  void initPage(){

    for(int i = 0; i < pageCount; i++){
      pages.add(Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('images/lake.jpg'),
            Text(
              "$i",
              style: TextStyle(
                color: Colors.yellow
              ),
            ),
          ],
        ),
        margin: EdgeInsets.all(20),
      ));
    }
  }

  void onTimer(Timer timer){

    if(!mounted){
      return;
    }

    _controller.animateToPage(_currSelect.curSelect+1, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void startTimer(){
    cancelTimer();
    timer = Timer.periodic(Duration(seconds: 4), onTimer);
  }

  void cancelTimer(){
    timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    timer?.cancel();
  }

  void onCurPageChange(curPage) {
    _currSelect.update(curPage);
  }

  Widget _getPageView(BuildContext context) {
    return PageView.builder(
      itemBuilder: (ctx, index) {
        return pages[index % pageCount];
      },
      onPageChanged: onCurPageChange,
      controller: _controller,
    );
  }

  Widget _getPageIndicator() {
    return _PageIndicator(itemCount: pageCount);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) {
        return _currSelect;
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          _getPageView(context),
          Positioned(
            child: _getPageIndicator(),
            bottom: 6,
          )
        ],
      ),
    );
  }
}

class _CurPage extends ChangeNotifier {
  int curSelect = 0;

  void update(int curSelect) {
    if (this.curSelect == curSelect) {
      return;
    }

    this.curSelect = curSelect;
    notifyListeners();
  }
}

class _PageIndicator extends StatefulWidget {
  int itemCount = 0;

  _PageIndicator({this.itemCount});

  @override
  _State createState() => _State();
}

class _State extends State<_PageIndicator> {

  List<Widget> getChildren(int curPage) {
    List<Widget> children = [];
    for (int i = 0; i < widget.itemCount; i++) {
      Color color;
      if (curPage == i) {
        color = Colors.red;
      } else {
        color = Colors.green;
      }

      children.add(Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<_CurPage>(
      builder: (ctx, curPage, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getChildren(curPage.curSelect % widget.itemCount),
        );
      }
    );
  }
}
