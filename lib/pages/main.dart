import 'package:flutter/material.dart';
import 'package:mydemo4/models/DataModel.dart';
import 'package:mydemo4/pages/home_page.dart';
import 'package:mydemo4/pages/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DataModel d1 = DataModel("_text", 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyDemo4",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        SecondPage.id: (context) => SecondPage(d1),
      },
    );
  }
}
