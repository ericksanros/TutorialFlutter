// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart'; //INCLUDE ENGLISH_WORDS PACKAGE FROM PUBSPEC.YAML, TO GENERATE WORDS

void main() => runApp(
    MyApp()); //WE USE THE ARROW SYMBOL FOR ONE-LINE FUNTIONS OR METHOD,void does not return,

class MyApp extends StatelessWidget {  //STATELESSWIDGET MAKE THE APP ITSELF A WIDGET
  @override
  Widget build(BuildContext context) {    //Constructor build, takes buildcontext as argument
   // final wordPair = WordPair.random(); //New final object, cant change the value, Wordpair gets random words from english_words
    return MaterialApp(      //MaterialApp configures the top level navigator
      title: 'Texto de prueba', // tittle of navigator
      home: Scaffold(        //Class that develop the basic material design visual layout structure
        appBar: AppBar(          //Toolbar
          title: Text('My first App'), //Texto en titulo de navbar
          backgroundColor: Color(0xFF455A64),
          centerTitle: true, //titulo centrado?
        ),
        body: Center(         //alineation of body
          child: RandomWords(), //call of class Randomwords, that generate random words in english
        ),
      ),
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

    Widget build(BuildContext context) { //constructor to show the random word generated
      final wordPair = WordPair.random();
      return Text(wordPair.asPascalCase);
    }

    Widget _buildSuggestions() {
  return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
}

}


