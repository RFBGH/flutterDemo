import 'package:flutter/material.dart';

import 'exercise_page.dart';

class ExerciseBook extends StatelessWidget {

  int _index = 0;
  ExerciseBook(int index){
    _index = index;
  }

  void openExerciseBook(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return ExercisePage();
    }));
  }
  
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){
        openExerciseBook(context);
      },
      child:   Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFFD7D7D7),
            ),
            width: double.infinity,
            height: 119,
            margin: EdgeInsets.only(top: 16, bottom: 24, left: 19, right: 19),
            padding: EdgeInsets.only(left: 114, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "同步轻松练习 $_index",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xFF000000),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: Text(
                    "fishing 上传",
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xCC000000),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "数学  六年级  上册",
                  style: TextStyle(fontSize: 12, color: const Color(0xCC000000)),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            left: 34,
            top: 0,
            child: Container(
              width: 88,
              height: 125,
              child: Image.asset(
                'images/lake.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  
  }
}
