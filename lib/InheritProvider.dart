

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InheritDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return InheritDemoState();
  }
}

class InheritDemoState extends State<InheritDemo>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: InheritProviderWidget(
          data: TestData(),
          child:Column(
            children: [
              Text(InheritProvder.of<TestData>(context, true).text),
              RaisedButton(
                  child: Text("change"),
                  onPressed: (){
                    InheritProvder.of<TestData>(context, true).setText("flypig");
                  }
              )
            ],
          ),
        )
      ),
    );
  }

}

class InheritProviderWidget<T extends Changeable> extends StatefulWidget{

  final T data;
  final Widget child;
  const InheritProviderWidget({Key key, this.data, this.child});

  @override
  State<StatefulWidget> createState() {
    return InheritProviderWidgetState(
      InheritProvder(
        child: child,
        data: data,
      ),
    );
  }
}

class TestData extends Changeable{

  String text = "";
  void setText(String text){
    this.text = text;
    notifyChanged();
  }
}

class InheritProvder<T extends Changeable> extends InheritedWidget{

  final T data;
  const InheritProvder({Key key, this.data, Widget child}):super(child: child);

  static T of<T extends Changeable>(BuildContext context, bool listen){
    if(listen){
      return context.dependOnInheritedWidgetOfExactType<InheritProvder<T>>().data;
    }else{
      return (context.getElementForInheritedWidgetOfExactType<InheritProvder<T>>()?.widget as InheritProvder)?.data;
    }
  }

  @override
  bool updateShouldNotify(covariant InheritProvder oldWidget) {
    return oldWidget.data != data;
  }
}

class InheritProviderWidgetState<T extends Changeable> extends State<InheritProviderWidget>{

  final InheritProvder child;
  InheritProviderWidgetState(this.child);

  void _update(){
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    child.data.addListener(_update);
  }

  @override
  void dispose() {
    super.dispose();
    child.data.removeListener(_update);
  }

  @override
  Widget build(BuildContext context) {
    return InheritProvder(
      data: child.data,
      child:child
    );
  }
}

class Changeable implements Listenable{

  List _listeners = [];

  @override
  void addListener(listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    _listeners.remove(listener);
  }

  void notifyChanged(){
    _listeners.forEach((element) {
      element();
    });
  }
}