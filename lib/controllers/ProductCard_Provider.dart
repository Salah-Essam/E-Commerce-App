import 'package:flutter/material.dart';

class ProductCard_Provider extends ChangeNotifier {
  final Set<String> _favorites = {};

  bool isFavorite(String productId) => _favorites.contains(productId);

  void toggleFavorite(String productId) {
    if (_favorites.contains(productId)) {
      _favorites.remove(productId);
    } else {
      _favorites.add(productId);
    }
    notifyListeners();
  }

  void selectSize() {
    notifyListeners();
  }
}
