import 'dart:convert';

import 'package:flutter01/widgets/custom_button._widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedBuilder(
                animation: Listenable.merge([posts, isLoader]),
                builder: (_, __) => isLoader.value
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: posts.value.length,
                        itemBuilder: (_, index) => ListTile(
                              title: Text(posts.value[index].title),
                            ))),
            const SizedBox(
              height: 10,
            ),
            ConstomButtonWidgt(
                disable: false,
                titleSize: 12,
                title: 'API',
                onPressed: () => callApi()),
          ]),
        ),
      ),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);
  factory Post.fromjson(Map json) {
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }
  @override
  String toString() {
    return 'id:$id';
  }
}
