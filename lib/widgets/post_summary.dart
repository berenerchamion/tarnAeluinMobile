import 'package:flutter/material.dart';

class PostSummary extends StatelessWidget {
  final int id;
  final String title;
  final DateTime date;

  const PostSummary(this.id, this.title, this.date, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(id.toString()),
        Text(title),
        Text(date.toIso8601String()),
      ],
    );
  }
}
