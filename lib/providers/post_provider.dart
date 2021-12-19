import 'package:flutter/material.dart';

class Post with ChangeNotifier {
  final int id;
  final String title;
  final DateTime created;
  final DateTime updated;
  final String imageUrl;
  bool? isFavorite;

  Post({
    required this.id,
    required this.title,
    required this.created,
    required this.updated,
    required this.imageUrl,
    isFavorite = false,
  });

  void _setFavoriteStatus(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }
}
