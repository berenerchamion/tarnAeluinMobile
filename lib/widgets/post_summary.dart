import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostSummary extends StatelessWidget {
  final int id;
  final String title;
  final String excerpt;
  final DateTime date;
  final String imageUrl;

  const PostSummary(this.id, this.title, this.excerpt, this.date, this.imageUrl,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(excerpt);
    return Container(
      padding: EdgeInsets.only(
        bottom: 5,
      ),
      child:  GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/post-details');
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
                        tag: id,
                        child: FadeInImage(
                          placeholder:
                          AssetImage('assets/images/ta-placeholder-master.png'),
                          image: NetworkImage(
                            imageUrl,
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
                    Text(title, style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      height: 5,
                    ),
                    Text('$excerpt...'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(DateFormat('MM/dd/yy').format(date)),
            ),
          ],
        ),
      ),
    );
  }
}
