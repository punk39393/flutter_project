import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCardScreen extends StatefulWidget {
@override
_MyCardScreenState createState() => _MyCardScreenState();
}

class _MyCardScreenState extends State<MyCardScreen> {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("card"),
),
body: Center(
child: Card(
elevation: 50,
shadowColor: Colors.black,
color: Colors.yellow,
child: SizedBox(
width: 300,
height: 275,
child: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
children: [
SizedBox(
    height: 10,
), //SizedBox
Text(
    "werqwewerwq",
    style: TextStyle(
        fontSize: 50,
        color: Colors.black,
        fontWeight: FontWeight.bold,
    ), //Textstyle
), //Text
SizedBox(
    height: 10,
),
Text(
    "qwerwer",
    style: TextStyle(
         fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold,
    ), //Textstyle
), //Text
SizedBox(
     height: 15,
), //SizedBox
Row(
children: [
Column(
children: [
Container(
child: Text(
    "wfsdfasdgafdsdcxv",
    style: TextStyle(
         fontSize: 23,
        color: Colors.black,
    ), //Textstyle
),
),
Text(
    "zxvbcvcxvxv",
    style: TextStyle(
         fontSize: 23,
        color: Colors.black,
    ), //Textstyle
),
Text(
    "cxzvcvcvz",
    style: TextStyle(
         fontSize: 23,
        color: Colors.black,
    ), //Textstyle
),
],
),
SizedBox(
    width: 50,
),
Column(
children: [
Text(
    "zxcvzv",
    style: TextStyle(
         fontSize: 23,
        color: Colors.black,
    ), //Textstyle
),
Text(
    "zcxvzcxvzxc",
    style: TextStyle(
         fontSize: 23,
        color: Colors.black,
    ), //Textstyle
),
Text(
    "zxcvzxcv",
    style: TextStyle(
         fontSize: 23,
        color: Colors.black,
    ), //Textstyle
),
],
),
],
),
SizedBox(
    height: 10,
), //SizedBox
],
), //Column
), //Padding
), //SizedBox
), //Card
),
);
}
}