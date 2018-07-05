import 'package:flutter/material.dart';
import 'package:flutter_app/api/postApi.dart';

class PostView extends StatelessWidget {
  final int id;
  final PostApi api;

  PostView(this.id, this.api);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Builder(builder: (BuildContext context) {
          return RaisedButton(child: Text('$id'), onPressed: () => showMessage(context, api));
        }));
  }

  void showMessage(BuildContext context, PostApi api) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Showing message")));
}
