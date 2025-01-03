import 'package:flutter/material.dart';
import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/Models/product_model.dart';

class ProductListViewModel extends ChangeNotifier {
  ProductModel _productModel = ProductModel();
  List<Product> _products = [];
  bool _loading = true;

  ProductListViewModel() {
    _loadProducts();
  }

  // cargar list de products
  Future<void> _loadProducts() async {
    _loading = true;
    notifyListeners();

    try {
      _products = await _productModel.getProducts();
      _loading = false;
      notifyListeners();
    } catch (e) {
      //errors
      // print("Error loading products: $e");
      _loading = false;
      notifyListeners();
    }
  }

  // list de products
  List<Product> get products => _products;

  bool get isLoading => _loading;
}
