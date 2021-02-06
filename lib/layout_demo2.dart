import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('layout demo'),
            ),
            body: ConstrainedBox(
              child: getDemo22(),
              constraints: BoxConstraints.tightFor(
                width: double.infinity,
                height: double.infinity,
              ),
            )
        ));
  }

  Widget getDemo0() {
    return Container(
      color: Colors.red,
    );
  }

  Widget getDemo1() {
    return Container(
      color: Colors.red,
      width: 100,
      height: 100,
    );
  }

  Widget getDemo2() {
    return Center(
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
    );
  }

  Widget getDemo3() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
    );
  }

  Widget getDemo4() {
    return Center(
      child: Container(
        color: Colors.red,
      ),
    );
  }

  Widget getDemo5() {
    return Center(
      child: Container(
        color: Colors.red,
        child: Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
      ),
    );
  }

  Widget getDemo6() {
    return Center(
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.all(20.0),
        child: Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
      ),
    );
  }

  Widget getDemo7() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child:Container(
        color: Colors.red,
        width: 10,
        height: 10,
      ),
    );
  }

  Widget getDemo8() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child:Container(
          color: Colors.red,
          width: 10,
          height: 10,
        ),
      ),
    );
  }

  Widget getDemo9(){
    return UnconstrainedBox(
      child: Container(
        width: 20,
        height: 100,
        color: Colors.red,
      ),
    );
  }

  Widget getDemo10(){
    return UnconstrainedBox(
      child: Container(
        width: 20,
        height: 1000,
        color: Colors.red,
      ),
    );
  }

  Widget getDemo11(){
    return OverflowBox(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,

      child: Container(
        width: 20,
        height: 1000,
        color: Colors.red,
      ),
    );
  }

  Widget getDemo12(){
    return UnconstrainedBox(
      child: Container(
        width: 20,
        height: double.infinity,
        color: Colors.red,
      ),
    );
  }

  Widget getDemo13(){
    return UnconstrainedBox(
      child:LimitedBox(
        maxHeight: 100,
        maxWidth: 100,
        child: Container(
          width: 20,
          height: double.infinity,
          color: Colors.red,
        ),
      )
    );
  }

  Widget getDemo14(){
    return FittedBox(
      child: Text('this is flypig'),
    );
  }

  Widget getDemo15(){
    return Center(
      child: FittedBox(
        child: Text('this is flypig'),
      ),
    );
  }

  Widget getDemo16(){
    return Center(
      child: FittedBox(
        child: Text('this is flypig this is flypig this is flypig this is flypig this is flypig this is flypig'),
      ),
    );
  }

  Widget getDemo17(){
    return Center(
      child: Text('this is flypig this is flypig this is flypig this is flypig this is flypig this is flypig'),
    );
  }

  Widget getDemo18(){
    return Row(
      children: [
        Container(
          color: Colors.red,
          child: Text('hello!'),
        ),
        Container(
          color: Colors.blue,
          child: Text('flypig!'),
        ),
      ],
    );
  }

  Widget getDemo19(){
    return Row(
      children: [
        Container(
          color: Colors.red,
          child: Text('hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!'),
        ),
        Container(
          color: Colors.blue,
          child: Text('flypig!'),
        ),
      ],
    );
  }

  Widget getDemo20(){
    return Row(
      children: [
        Expanded(
          child:Container(
            color: Colors.red,
            child: Text('hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!'),
          ),
        ),
        Expanded(
          child:Container(
            color: Colors.green,
            child: Text('hhhhhhh'),
          ),
        ),

        Container(
          color: Colors.blue,
          child: Text('flypig!'),
        ),
      ],
    );
  }

  Widget getDemo21(){
    return Scaffold(
        body: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Text('hello!'),
              Text('flypig'),
            ],
          ),
        ),
    );
  }

  Widget getDemo22(){
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Text('hello!'),
              Text('flypig'),
              Column(
                children: [
                  Text('2222'),
                  Text('3333'),
                  Text('4444'),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}