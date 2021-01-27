import 'package:flutter/material.dart';
import 'stack_demo.dart';

void main() {

  new Future((){
    return 1;
  })
  .then((value){
    print("then $value");
  });

  return runApp(new MyApp());
}
