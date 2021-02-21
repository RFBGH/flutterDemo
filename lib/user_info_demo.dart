import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'user info demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text("user info demo"),
          ),
          body: Container(
            constraints: BoxConstraints.expand(
                width: double.infinity, height: double.infinity),
            decoration: BoxDecoration(color: Colors.grey),
            child: Row(
              children: [
                Expanded(
                    child: UserInfoWidget()),
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text("no expand"),
                ),
              ],
            ),
            alignment: Alignment.topLeft,
          )),
    );
  }
}

class UserInfoWidget extends StatefulWidget {
  @override
  _UserInfoWidgetState createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue
      ),

      child: UnconstrainedBox(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage('images/lake.jpg'),
                    ),
                  ),
                  Positioned(
                    top: 3.0,
                    right: 3.0,
                    child: ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red
                        ),
                        width: 8.0,
                        height: 8.0,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0),
                  child:Text("grade one")
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }
}
