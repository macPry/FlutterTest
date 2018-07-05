import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/api/Post.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

abstract class PostApi {
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts();
}

class RealPostApi implements PostApi {
  static const BASE_URL = 'https://jsonplaceholder.typicode.com/';

  @override
  Future<Post> getPost(int id) async {
    return await http
        .get(BASE_URL + 'posts/$id')
        .then((response) => jsonDecode(response.body))
        .then((post) => Post.fromJson(post));
  }

  @override
  Future<List<Post>> getPosts() async {
    return await http
        .get(BASE_URL + 'posts/')
        .then((response) => jsonDecode(response.body))
        .then((body) {
      final List list = body;
      return list.map((post) => Post.fromJson(post)).toList();
    });
  }
}

class MockPostApi extends Mock implements PostApi {}
