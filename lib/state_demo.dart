import 'package:flutter/material.dart';

typedef OnButtonClickCallback = void Function();

class MyApp extends StatelessWidget {
  MyStateWidget _myStateWidget = new MyStateWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "state demo",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("state demo"),
        ),
        body: Center(
          child: Column(
            children: [
              _myStateWidget,
              IconButton(
                icon: Icon(Icons.import_contacts),
                onPressed: () {
                  _myStateWidget.trigger();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyStateWidget extends StatefulWidget {
  MyState _state = MyState();

  void trigger() {
    _state.trigger();
  }

  @override
  State<StatefulWidget> createState() {
    return _state;
  }
}

class MyState extends State<MyStateWidget> {
  bool _trigger = false;

  void trigger() {
    setState(() {
      _trigger = !_trigger;
    });
  }

  List<Widget> getChildren() {
    return [_trigger ? Text("trigger") : Icon(Icons.icecream)];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: getChildren(),
    );
  }
}
