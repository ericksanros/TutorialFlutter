// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; //INCLUDE ENGLISH_WORDS PACKAGE FROM PUBSPEC.YAML, TO GENERATE WORDS
import 'package:flutter/rendering.dart'; 

void main() => runApp(
    MyApp()); //WE USE THE ARROW SYMBOL FOR ONE-LINE FUNTIONS OR METHOD,void does not return,

class MyApp extends StatelessWidget {  //STATELESSWIDGET MAKE THE APP ITSELF A WIDGET
  @override
  Widget build(BuildContext context) {    //Constructor build, takes buildcontext as argument
   // final wordPair = WordPair.random(); //New final object, cant change the value, Wordpair gets random words from english_words
    return MaterialApp(      //MaterialApp configures the top level navigator
      title: 'Startup Name Generator', // tittle of navigator
      home: RandomWords(),        //Class that develop the basic material design visual layout structure
        //appBar: AppBar(          //Toolbar
          //title: Text('My first App'), //Texto en titulo de navbar
          //backgroundColor: Color(0xFF455A64),
          //centerTitle: true, //titulo centrado?
        //),
        //body: Center(         //alineation of body
          //child: RandomWords(), //call of class Randomwords, that generate random words in english
        //),
      //),
    );
  }
}

class RandomWords extends StatefulWidget {//creation of a stateful widget, this requires 2 clasess.by adding stful and the IDE does the rest of the code
  @override
  _RandomWordsState createState() => _RandomWordsState(); //
}

class _RandomWordsState extends State<RandomWords> {//second class of stateful widget, this one save the list of words generated before by randomwords
 @override
 final _suggestions = <WordPair>[]; //to save the words generated 
 final _biggerFont = TextStyle(fontSize: 18.0); //Make the font bigger.
 final _saved = <WordPair>{}; //Saves the selected words by the user, we use a _saved instead of _list because if its well ,implemented can prevent repeated

    Widget build(BuildContext context) { //constructor to show the random word generated
       return Scaffold(
    appBar: AppBar(
      title: Text('Startup Name Generator'),
    ),
    body: _buildSuggestions(),
  );
    }

    Widget _buildSuggestions() { //Widget to construct the list of random words
  return ListView.builder(
      padding: EdgeInsets.all(16.0),  //Setting padding
      itemBuilder: /*1*/ (context, i) {  //*1* itembuioder is called once per sugested word and places each word into a ListView
            //Ffor even rows it adds a listtitle, for odd rows the funtion Divider add a visual separation.
        if (i.isOdd) return Divider(); //*2* Adds a one pixel heigth divider for each row in ListView

        final index = i ~/ 2; //*3* 
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); //*4* if you reach the limit of generated word, it generate 10 more and add them to the list
        }
        return _buildRow(_suggestions[index]); 
      });
}
Widget _buildRow(WordPair pair) {
  final alreadySaved = _saved.contains(pair); //Verification for saved word to know if its alreadey saved
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
    trailing: Icon( //Adds icon next to the tittle of each row
    alreadySaved ? Icons.favorite : Icons.favorite_border, //define the icon for each row
    color: alreadySaved ? Colors.red : null, //Colors the icon when saved or marked as fav.
    ),
    onTap: (){ //Set state of icon when tapped
      setState(() { //Notify the framework that the internal state of this object has changed.
        if(alreadySaved){  
          _saved.remove(pair);
          } else {
          _saved.add(pair); 
          }
      });
    } //onTap
  );

}

}


