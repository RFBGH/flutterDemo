

import 'package:flutter/material.dart';

class FreeCourseBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 17, right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            child: Image.asset('images/advertising.png'),
          ),
          SizedBox(width: 8,),
          Expanded(
            child:Text(
              "知识点资料大放送",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1F2021),
              ),
            ),
          ),
          Container(
            width: 6.52,
            height: 11.7,
            child: Image.asset('images/right_arrow.png'),
          ),
        ],
      ),
    );
  }
}
