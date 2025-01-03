import 'package:flutter/material.dart';
import 'package:foodloop/Entities/product_entity.dart';

class ProductListState extends ChangeNotifier {
  List<Product> _prods = [];
  bool _loading = true;
  bool _error = false;

  List<Product> getProducts() {
    return _prods;
  }

  void setProducts(List<Product> prods) {
    _loading = false;
    _prods = prods;
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