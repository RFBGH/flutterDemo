import 'package:flutter/material.dart';
import 'user_info_demo.dart';

void main() {

  new Future((){
    return 1;
  })
  .then((value){
    print("then  11 $value");
  });

  return runApp(new MyApp());
}
