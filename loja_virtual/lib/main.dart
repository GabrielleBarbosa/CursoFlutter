import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/home_screen.dart';

void main() async{
  runApp(MyApp());

  QuerySnapshot snapshot = await Firestore.instance.collection('home').getDocuments();
  print (snapshot.documents.length);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141) //a, r, g, b
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

