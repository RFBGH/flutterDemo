import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
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
    return new ListTile(
      title: new Text(
          pair.asPascalCase,
          style: _biggerFont),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}