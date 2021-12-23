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
    Provider.of<Posts>(context, listen: false).fetchPosts().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<Posts>(context);
    final posts = postsData.posts;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tarn Aeluin Posts'),
      ),
      body: Container(
        child: Text("Here I am... ${posts.length}"),
      ),
    );
  }
}
