import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_product_service.dart';
import 'package:foodloop/ServiceAdapters/Interface/product_service.dart';

class ProductModel {
  ProductService prodService = FbProductService();

  static int calculateProductDiscount(Product prod) {
    return ((1 - (prod.discountPrice / prod.price)) * 100).round();
  }

  Future<Product?> getProductById(String id) {
    return prodService.getProductById(id);
  }

  Future<List<Product>> getProducts() {
    return prodService.getProducts();
  }
}