import 'package:flutter/material.dart';
import 'post_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Posts with ChangeNotifier {
  final String _baseUrl = dotenv.get('TARN_AELUIN_BASE_URL');
  List<Post> _posts = [];

  Posts(this._posts);

  List<Post> get posts {
    return [...posts];
  }

  Future<void> fetchPosts() async {
    Uri uriPosts = Uri.parse('$_baseUrl/wp-json/wp/v2/posts');

    try {
      final response = await get(uriPosts);
      final extractedData = json.decode(response.body);
      print(extractedData);
    } catch (error) {
      print('Post fetch error from Tarn Aeluin');
      rethrow;
    }
  }
}
