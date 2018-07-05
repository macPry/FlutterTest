import 'package:flutter/material.dart';
import 'package:flutter_app/PostsView.dart';
import 'package:flutter_app/api/postApi.dart';

void main() => runApp(MyApp(RealPostApi()));

class MyApp extends StatelessWidget {
  final PostApi api;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostsView(api));

  MyApp(this.api);
}
