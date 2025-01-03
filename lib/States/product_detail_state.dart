import 'package:flutter/material.dart';
import 'package:foodloop/Entities/product_entity.dart';

class ProductDetailState extends ChangeNotifier {
  Product? _prod;
  bool _loading = true;

  void setProduct(Product? prod) {
    _prod = prod;
    _loading = false;
    notifyListeners();
  }

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Product? getProduct() {
    return _prod;
  }

  bool isLoading() {
    return _loading;
  }
}