import 'package:chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.blue
        )
      ),
      home: ChatScreen()
    );
  }
}


