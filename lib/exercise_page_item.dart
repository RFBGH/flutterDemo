
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExercisePageItem extends StatelessWidget {

  int pageIndex = 0;

  ExercisePageItem({this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 66,
            height: 94,
            child: Image.asset(
              'images/lake.jpg',
              fit: BoxFit.fill,
            ),
            margin: EdgeInsets.only(bottom: 8),
          ),
          Text(
              "第$pageIndex页",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
