import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Dog.dart';
import 'package:flutter_app/futureUtils.dart';

class DogsView extends StatefulWidget {
  @override
  _DogsViewState createState() => _DogsViewState();
}

class _DogsViewState extends State<DogsView> {
  @override
  Widget build(BuildContext context) {
    var listBuilder = FutureBuilder(
        future: getDogs(),
        builder: (BuildContext context, AsyncSnapshot<List<Dog>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.waiting:
              return Text('wait');
            default:
              if (snapshot.hasError)
                return Text('${snapshot.error}');
              else
                return showDogs(context, snapshot.data);
          }
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Ass'),
      ),
      body: listBuilder,
    );
  }
}

Future<List<Dog>> getDogs() async {
  var list = List.generate(5, (index) => Dog(index.toString()));
  await wait(3);
  return list;
}

Widget showDogs(BuildContext context, List<Dog> dogs) => ListView.builder(
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTileTheme(
              textColor: Colors.green,
              child: ListTile(title: Text(dogs[index].name)),
            ),
            Divider(height: 2.0, color: Colors.red)
          ],
        );
      },
    );
