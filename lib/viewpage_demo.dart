import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: new MyViewPage(),
    );
  }
}

class MyViewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyViewPageState();
  }
}

class MyViewPageState extends State<MyViewPage>{

  PageController controller = PageController();
  int curIndex = 0;
  
  Widget getPage(BuildContext context, int index){
    switch(index){
      case 0:
        return Center(
            child:Text("first Page")
        );

      default:
        return Center(
            child:Text("Second Page")
        );
    }
  }
  
  void onTabClick(int index){
    controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }

  void onTabChange(int index){
    setState(() {
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Demo'),
      ),
      body: PageView.builder(
        itemBuilder: getPage,
        controller: controller,
        onPageChanged: onTabChange,
        itemCount: 2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'A'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'B'
          ),
        ],
        currentIndex: curIndex,
        onTap: onTabClick,
      ),
    );

  }

}