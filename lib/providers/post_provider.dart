import 'package:flutter/material.dart';

class Post with ChangeNotifier {
  final int id;
  final String title;
  final String excerpt;
  final DateTime created;
  final DateTime updated;
  final String imageUrl;
  bool isFavorite = false;

  Post({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.created,
    required this.updated,
    required this.imageUrl,
    //todo we will need to handle setting isFavorite from the saved condition
  });

  void _setFavoriteStatus(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  //todo adding this for the future network call to store this.
  Future<void> toggleFavoriteStatus() async {
    _setFavoriteStatus(!isFavorite);
  }
}
