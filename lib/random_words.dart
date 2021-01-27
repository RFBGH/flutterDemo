import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'news.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: new RandomWords(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return new MaterialApp(
//       title: 'Welcome to Flutter',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Welcome to Flutter'),
//         ),
//         body: new Center(
//           child: new RandomWords(),
//         ),
//       ),
//     );
//   }
// }


class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _sugguestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize:18);

  final _saved = <WordPair>{};

  Widget _buildSuggestions(){

    return new ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i){
        if(i.isOdd){
          return new Divider();
        }

        final index = i ~/ 2;
        if(index >= _sugguestions.length){
          _sugguestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_sugguestions[index]);
      },
    );

  }

  Widget _buildRow(WordPair pair){

    final hasSaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
          pair.asPascalCase,
          style: _biggerFont
      ),
      trailing: new Icon(
        hasSaved?Icons.favorite:Icons.favorite_border,
        color: hasSaved?Colors.red:null,
      ),
      onTap: (){
        setState(() {
          if(hasSaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: [
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(icon: new Icon(Icons.access_alarm), onPressed: _test)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _test(){
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context){
          return Scaffold(
            appBar: new AppBar(
              title: new Text("My News"),
            ),
            body: FutureBuilder(
                future: getNews(),
                builder: (BuildContext context, AsyncSnapshot<Response> snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data.toString());
                  }else if(snapshot.hasError){
                    return Text("something is wrong ${snapshot.error.toString()}");
                  }else{
                    return Text("loading");
                  }
                }
            ),
          );
        })
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context){
          final tiles = _saved.map(
                  (pair){
                return new ListTile(
                    title: new Text(
                        pair.asPascalCase,
                        style:_biggerFont
                    )
                );
              }
          );

          final divdier = ListTile.divideTiles(
            context:context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divdier,),
          );
        })
    );
  }

}