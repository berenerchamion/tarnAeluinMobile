import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  static const String routeName = '/post-details';
  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details for $postId'),
      ),
      body: Text('Here is my post details...'),
    );
  }
}
