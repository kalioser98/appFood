import 'package:flutter/material.dart';
import 'package:foodloop/Entities/product_entity.dart';

class FavoritesListState extends ChangeNotifier {
  List<Product> _favorites = [];
  bool _loading = true;

  List<Product> getFavorites() {
    return _favorites;
  }

  void setFavorites(List<Product> favs) {
    _loading = false;
    _favorites = favs;
    notifyListeners();
  }

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  bool isLoading() {
    return _loading;
  }
}