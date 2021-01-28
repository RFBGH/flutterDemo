import 'package:flutter/material.dart';
import 'viewpage_demo.dart';

void main() {

  new Future((){
    return 1;
  })
  .then((value){
    print("then  11 $value");
  });

  return runApp(new MyApp());
}
