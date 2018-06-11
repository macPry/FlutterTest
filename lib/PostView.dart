import 'package:flutter/material.dart';
import 'package:flutter_app/api/Post.dart';
import 'package:flutter_app/api/postApi.dart';

class PostView extends StatefulWidget {
  final PostApi api;
  PostView(this.api);

  @override
  _PostViewState createState() => _PostViewState(api);
}

class _PostViewState extends State<PostView> {
  final PostApi api;
  _PostViewState(this.api);

  @override
  Widget build(BuildContext context) {
    var listBuilder = FutureBuilder(
        future: api.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData)
            return showPosts(context, snapshot.data);
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

/*Widget showPost(BuildContext context, Post post) => Column(children: <Widget>[
      Text(post.id.toString()),
      Text(post.title),
      Text(post.body)
    ]);*/

Widget showPosts(BuildContext context, List<Post> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTileTheme(
              textColor: Colors.green,
              child: ListTile(title: Text(posts[index].title)),
            ),
            Divider(height: 2.0, color: Colors.red)
          ],
        );
      },
    );
