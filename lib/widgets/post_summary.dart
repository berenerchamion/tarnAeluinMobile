import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/post_provider.dart';

class PostSummary extends StatelessWidget {
  final Post post;

  const PostSummary(this.post,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 5,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/post-details', arguments: post.id);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAlias,
                child: GridTile(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white54,
                          blurRadius: 3.0,
                          spreadRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Hero(
                        tag: post.id,
                        child: FadeInImage(
                          placeholder: AssetImage(
                              'assets/images/ta-placeholder-master.png'),
                          image: NetworkImage(
                            post.imageUrl,
                          ),
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        )),
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
                    child: Icon(Icons.favorite),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
