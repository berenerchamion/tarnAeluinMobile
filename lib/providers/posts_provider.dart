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
        String t = extractedData[i]['yoast_head_json']['title'];
        int cut = t.indexOf('•');
        if (cut != -1) {
          t = t.substring(0, (cut -1));
        }
        loadedPosts.add(Post(
          id: extractedData[i]['id'],
          title: t,
          excerpt: extractedData[i]['yoast_head_json']['description'],
          created: DateTime.parse(extractedData[i]['date']),
          updated: DateTime.parse(extractedData[i]['modified']),
          imageUrl: extractedData[i]['jetpack_featured_media_url'],
        ));
      }
      _posts = loadedPosts;
      notifyListeners();
    } catch (error) {
      print('Post fetch error from Tarn Aeluin');
      rethrow;
    }
  }
}
