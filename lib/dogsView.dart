import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/futureUtils.dart';

class DogsView extends StatefulWidget {
  @override
  DogsViewState createState() => new DogsViewState();
}

class DogsViewState extends State<DogsView> {
  @override
  Widget build(BuildContext context) {
    var listBuilder = new FutureBuilder(
        future: getDogs(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('none');
            case ConnectionState.waiting:
              return new Text('wait');
            default:
              if (snapshot.hasError)
                return new Text('${snapshot.error}');
              else
                return new Text('${snapshot.data}');
          }
        });

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ass'),
      ),
      body: listBuilder,
    );
  }

  Future<List<String>> getDogs() async {
    var list = new List<String>();
    list.add("a");
    list.add("b");
    await wait(3);
    return list;
  }
}
