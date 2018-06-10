import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/api/Post.dart';
import 'package:http/http.dart' as http;

Future<Post> getPost() async {
  return await http.get('https://jsonplaceholder.typicode.com/posts/1')
      .then((response) => jsonDecode(response.body))
      .then((user) => Post.fromJson(user));
}
