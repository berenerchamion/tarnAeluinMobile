import 'package:flutter/material.dart';

class PostsListScreen extends StatefulWidget {
  const PostsListScreen({Key? key}) : super(key: key);

  @override
  _PostsListScreenState createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tarn Aeluin Posts'),
      ),
      body: Column(
        children: const <Widget>[
          Text('This is the first post'),
          Text('This is the second post'),
          Text('This is the third post'),
          Text('This is the fourth post'),
        ],
      ),
    );
  }
}

