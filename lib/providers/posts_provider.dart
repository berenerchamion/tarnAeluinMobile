import 'package:flutter/material.dart';
import 'post_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'dart:convert';

import './post_provider.dart';

class Posts with ChangeNotifier {
  final String _baseUrl = dotenv.get('TARN_AELUIN_BASE_URL');
  List<Post> _posts = [];

  Posts(this._posts);

  List<Post> get posts {
    return [..._posts];
  }

  Future<void> fetchPosts() async {
    Uri uriPosts = Uri.parse('$_baseUrl/wp-json/wp/v2/posts');

    try {
      final response = await get(uriPosts);
      final extractedData = json.decode(response.body);
      final List<Post> loadedPosts = [];

      for (int i = 0; i < extractedData.length; i++) {
        loadedPosts.add(Post(
          id: extractedData[i]['id'],
          title: extractedData[i]['title']['rendered'],
          created: DateTime.parse(extractedData[i]['date']),
          updated: DateTime.parse(extractedData[i]['modified']),
          imageUrl: 'This is my image url',
        ));
      }

    } catch (error) {
      print('Post fetch error from Tarn Aeluin');
      rethrow;
    }
  }
}
