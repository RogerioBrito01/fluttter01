import 'dart:convert';

import 'package:flutter01/controller/posts_controller.dart';
import 'package:flutter01/widgets/custom_button._widget.dart';

import 'package:flutter/material.dart';

import '../models/posts_model.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  final PostController _controller = PostController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedBuilder(
                animation:
                    Listenable.merge([_controller.posts, _controller.isLoader]),
                builder: (_, __) => _controller.isLoader.value
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _controller.posts.value.length,
                        itemBuilder: (_, index) => ListTile(
                              title: Text(_controller.posts.value[index].title),
                            ))),
            const SizedBox(
              height: 10,
            ),
            ConstomButtonWidgt(
                disable: false,
                titleSize: 12,
                title: 'API',
                onPressed: () => _controller.callApi()),
          ]),
        ),
      ),
    );
  }
}
