import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';

import '../providers/post_provider.dart';

class PostSummary extends StatelessWidget {
  final Post post;

  const PostSummary(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Post>(
      builder: (ctx, post, child) => Container(
        padding: EdgeInsets.only(
          bottom: 5,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/post-details', arguments: post.id);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Card(
                  elevation: 5.0,
                  shadowColor: Colors.black,
                  margin: EdgeInsets.all(5.0),
                  child: Hero(
                    tag: post.id,
                    child: FadeInImage(
                      placeholder: AssetImage(
                          'assets/images/ta-placeholder-master.png'),
                      image: NetworkImage(
                        post.imageUrl,
                      ),
                      fit: BoxFit.cover,
                      height: 125,
                      width: 150,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${post.excerpt}...'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      DateFormat('MM/dd/yy').format(post.created),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      child: post.isFavorite
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        post.toggleFavoriteStatus();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
