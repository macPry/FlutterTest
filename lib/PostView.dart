import 'package:flutter/material.dart';
import 'package:flutter_app/api/Post.dart';
import 'package:flutter_app/api/postApi.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    var listBuilder = FutureBuilder(
        future: getPost(),
        builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
          if (snapshot.hasData)
            return showPost(context, snapshot.data);
          else if (snapshot.hasError) return Text('${snapshot.error}');
          return CircularProgressIndicator();
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Ass'),
      ),
      body: Center(child: listBuilder),
    );
  }
}

Widget showPost(BuildContext context, Post post) => Column(children: <Widget>[
      Text(post.id.toString()),
      Text(post.title),
      Text(post.body)
    ]);

/*Widget showDogs(BuildContext context, List<String> dogs) => ListView.builder(
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTileTheme(
              textColor: Colors.green,
              child: ListTile(title: Text(dogs[index])),
            ),
            Divider(height: 2.0, color: Colors.red)
          ],
        );
      },
    );*/
