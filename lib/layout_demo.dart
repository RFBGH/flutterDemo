import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500]
                  ),
                ),
              ],
            ),
          ),
          _FavoriteWidget()
          // new Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // new Text('41'),
        ],
      ),
    );
    
    Column buildButtonColumn(IconData icon, String label){
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top:8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color:color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    Widget imageSections = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 10.0, color: Colors.black38),
              borderRadius: const BorderRadius.all(const Radius.circular(8.0))
            ),
            child: Image.asset(
                'images/lake.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.fill),
          ),
          flex: 2,
        ),
        Expanded(
          child: Image.asset(
              'images/lake.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fill),
          flex: 1,
        ),
        Expanded(
          child: Image.asset(
              'images/lake.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fill),
          flex: 1,
        )
      ],
    );

    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("layout demo"),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.fill,
            ),
            titleSection,
            buttonSection,
            textSection,
            imageSections
          ],
        ),
      ),
    );
  }
}

class _FavoriteWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FavoriteState();
  }
}

class _FavoriteState extends State<_FavoriteWidget>{

  var favorite = false;
  var favoriteCount = 0;

  void _favorite(){

    setState(() {
      if(favorite){
        favoriteCount--;
      }else{
        favoriteCount++;
      }
      favorite = !favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            favorite?Icons.star:Icons.star_border,
            color: favorite?Colors.red:Colors.grey[500],
          ),
          onPressed: _favorite
        ),
        Text('$favoriteCount')
      ],
    );
  }
}