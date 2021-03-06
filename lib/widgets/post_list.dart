import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts_provider.dart';
import '../providers/post_provider.dart';
import './post_summary.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<Posts>(context);
    final List<Post> posts = postsData.posts;

    return Scaffold(
        body: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: posts.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: posts[index],
        child: PostSummary(posts[index]),
      ),
    ));
  }
}
