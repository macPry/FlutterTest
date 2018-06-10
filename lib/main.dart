import 'package:flutter/material.dart';
import 'package:flutter_app/dogsView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var title = 'Flutter Demo';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DogsView()
    );
  }
}
