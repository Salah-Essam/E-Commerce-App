import 'dart:async';

import 'package:e_commerce/controllers/database_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductCard_Provider extends ChangeNotifier {
  String _size = "";
  String _color = "";
  final Set<String> _favorites = {};
  late final Database database;
  late final Stream<Set<String>> _favoriteStream;
  late final StreamSubscription<Set<String>> _favoritesSubscription;

  String get size => _size;
  String get color => _color;

  ProductCard_Provider() {
    if (FirebaseAuth.instance.currentUser != null) {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      database = FirestoreDatabase(uid: userId);
      _favoriteStream = database.favoriteProductsStream();
      _favoritesSubscription = _favoriteStream.listen((newFavorites) {
        _favorites
          ..clear()
          ..addAll(newFavorites);
        notifyListeners();
      });
    } else {
      print('No user logged in!');
    }
  }

  bool isFavorite(String productId) => _favorites.contains(productId);

  void toggleFavorite(String productId) {
    if (_favorites.contains(productId)) {
      database.deleteFavoriteProduct(productId);
    } else {
      database.setFavoriteProduct(productId);
    }

    notifyListeners();
  }

  void updateSize(String value) {
    _size = value;
    notifyListeners();
  }

  void updateColor(String value) {
    _color = value;
    notifyListeners();
  }

  void NotifyListeners() {
    notifyListeners();
  }

  @override
  void dispose() {
    _favoritesSubscription.cancel();
    super.dispose();
  }
}
