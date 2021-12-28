import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  static const String routeName = '/post-details';
  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Text('Here is my post details...'),
    );
  }
}
