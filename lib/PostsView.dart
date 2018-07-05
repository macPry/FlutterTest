import 'package:flutter/material.dart';
import 'package:flutter_app/PostView.dart';
import 'package:flutter_app/api/Post.dart';
import 'package:flutter_app/api/postApi.dart';

class PostsView extends StatefulWidget {
  //DI needed and move out logic from view
  final PostApi api;
  PostsView(this.api);

  @override
  _PostsViewState createState() => _PostsViewState(api);
}

class _PostsViewState extends State<PostsView> {
  final PostApi api;
  _PostsViewState(this.api);

  @override
  Widget build(BuildContext context) {
    var listBuilder = FutureBuilder(
        future: api.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData)
            return showPosts(context, snapshot.data, onClick);
          else if (snapshot.hasError) return Text('${snapshot.error}');
          return CircularProgressIndicator();
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Center(child: listBuilder),
    );
  }

  void onClick(BuildContext context, int id) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => PostView(id, api)));
}

Widget showPosts(BuildContext context, List<Post> posts, onClick) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTileTheme(
              textColor: Colors.green,
              child: ListTile(
                title: Text(posts[index].title),
                onTap: () => onClick(context, posts[index].id),
              ),
            ),
            Divider(height: 2.0, color: Colors.red)
          ],
        );
      },
    );
