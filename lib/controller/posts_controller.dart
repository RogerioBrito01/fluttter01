import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/posts_model.dart';

class PostController {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> isLoader = ValueNotifier<bool>(false);
  callApi() async {
    var client = http.Client();
    try {
      isLoader.value = true;
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromjson(e)).toList();
      await Future.delayed(Duration(seconds: 3));

      print(posts);
    } finally {
      client.close();
      isLoader.value = false;
    }
  }
}
