import 'package:foodloop/Entities/product_entity.dart';

class CartProduct {
  Product product;
  int quantity;

  CartProduct(this.product, {this.quantity = 0});
}