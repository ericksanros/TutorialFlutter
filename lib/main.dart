// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart'; //INCLUDE ENGLISH_WORDS PACKAGE FROM PUBSPEC.YAML, TO GENERATE WORDS 

void main() => runApp(MyApp()); //WE USE THE ARROW SYMBOL FOR ONE-LINE FUNTIONS OR METHOD,void does not return, 

class MyApp extends StatelessWidget { //STATELESSWIDGET MAKE THE APP ITSELF A WIDGET 
  @override
  Widget build(BuildContext context) { //Constructor build, takes buildcontext as argument
    final wordPair = WordPair.random();  //New final object, cant change the value, Wordpair gets random words from english_words
    return MaterialApp( //MaterialApp configures the top level navigator
      title: 'Texto de prueba', // tittle of navigator
      home: Scaffold( //Class that develop the basic material design visual layout structure
        appBar: AppBar( //Toolbar
          title: Text('My first App'), //Texto en titulo de navbar
            backgroundColor: Color(0xFF455A64), 
            centerTitle: true, //tituli centrado?
        ),
        body: Center( //alineation of body
          child: Text(wordPair.asPascalCase), 
        ),
      ),
    );
  }
}  //end


class list1 extends StatefulWidget {
  @override
  _list1State createState() => _list1State();
}

class _list1State extends State<list1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}