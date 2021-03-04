import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'free_course_banner.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'paint demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('low price demo'),
        ),
        body: Column(
          children: [
            LowPriceCourseItemWidget(),
            SizedBox(height: 20,),
            FreeCourseBanner(),
          ],
        ),
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'images/lake.jpg',
                      fit: BoxFit.fill,
                    )),
                width: 75,
                height: 100,
                margin: EdgeInsets.only(right: 12),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "2021年四级英语听力课",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F2021),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    width: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 6, right: 6),
                    decoration:
                        BoxDecoration(color: Color(0xFFE6F4FF), borderRadius: BorderRadius.all(Radius.circular(4))),
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
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "3月14日-三月24日",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8F9294),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 57,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "￥",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFFF5C83),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "3",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFFF5C83),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ])),
                Text(
                  "￥399",
                  style: TextStyle(
                      color: Color(0xFF8F9294),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
