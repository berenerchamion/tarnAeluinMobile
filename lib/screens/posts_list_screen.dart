import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts_provider.dart';
import '../widgets/post_summary.dart';

class PostsListScreen extends StatefulWidget {
  const PostsListScreen({Key? key}) : super(key: key);

  @override
  _PostsListScreenState createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Provider.of<Posts>(context, listen:false).fetchPosts().then((_) {
      setState((){
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tarn Aeluin Posts'),
      ),
      body: Column(
        children: <Widget>[
          PostSummary(1, 'This is the first post', DateTime.now()),
          PostSummary(2, 'This is the second post', DateTime.now()),
          PostSummary(3, 'This is the third post', DateTime.now()),
          PostSummary(4, 'This is the fourth post', DateTime.now()),
        ],
      ),
    );
  }
}

