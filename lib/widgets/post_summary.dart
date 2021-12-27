import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';

class PostSummary extends StatelessWidget {
  final int id;
  final String title;
  final DateTime date;
  final String imageUrl;

  const PostSummary(this.id, this.title, this.date, this.imageUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Hero(
              tag: id,
              child: FadeInImage(
                placeholder:
                AssetImage('assets/images/ta-placeholder-master.png'),
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              )
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(title),
        ),
        Expanded(
          child: Text(DateFormat('MM/dd/yyyy').format(date)),
        ),
      ],
    );
  }
}
