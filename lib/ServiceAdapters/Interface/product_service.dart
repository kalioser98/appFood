import 'package:foodloop/Entities/product_entity.dart';

abstract class ProductService {
  Future<List<Product>> getProducts();
  Future<Product?> getProductById(String id);
}