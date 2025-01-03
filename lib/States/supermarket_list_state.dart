import 'package:flutter/material.dart';
import 'package:foodloop/Entities/supermarket_entity.dart';

class SupermarketListState extends ChangeNotifier {
  List<Supermarket> _supers = [];
  bool _loading = true;
  bool _error = false;

  List<Supermarket> getSupermarkets() {
    return _supers;
  }

  void setSupermarkets(List<Supermarket> supers) {
    _loading = false;
    _supers = supers;
    notifyListeners();
  }

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  bool isLoading() {
    return _loading;
  }

  void setError(bool errorOcurred) {
    _error = errorOcurred;
    notifyListeners();
  }

  bool errorOcurred() {
    return _error;
  }
}