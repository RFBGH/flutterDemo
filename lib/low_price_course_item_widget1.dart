
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'paint demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('low price demo'),
        ),
        body: LowPriceCourseItemWidget(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class LowPriceCourseItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      height: 132,
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 16,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('images/lake.jpg', fit: BoxFit.fill,)
              ),
              width: 75,
              height: 100,
            ),
          ),
          Positioned(
            top: 16,
            left: 103,
            right: 16,
            child: Text(
              "2021年四级英语听力课",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2021),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            top: 46,
            left: 103,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 6, right: 6),
              decoration: BoxDecoration(
                  color: Color(0xFFE6F4FF),
                  borderRadius: BorderRadius.all(Radius.circular(4))
              ),
              height: 18,
              child: Text(
                "专业课指导",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1984FF),
                ),
              ),
            ),
          ),
          Positioned(
              top: 101.4,
              left: 103,
              child: Text(
                "3月14日-三月24日",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8F9294),
                ),
              )
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Text(
              "￥399",
              style: TextStyle(
                  color: Color(0xFF8F9294),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  decoration  : TextDecoration.lineThrough
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 35,
            child: Text.rich(TextSpan(
              children: [
                TextSpan(
                  text:"￥",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFF5C83),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text:"3",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFFF5C83),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]
            )),
          ),
        ],
      ),
    );
  }
}

