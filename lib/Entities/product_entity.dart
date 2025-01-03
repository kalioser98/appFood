import 'package:foodloop/Entities/supermarket_entity.dart';

class Product {
  static const PROD_ID = "HwovqMB7i9kDN0sjQYyF";

  String id;
  String name;
  String description;
  double price;
  double discountPrice;
  String imgUrl;
  String expirationDate;
  Supermarket? store;

  Product(
    this.id,
    this.name,
    this.description,
    this.price,
    this.discountPrice,
    this.imgUrl,
    this.expirationDate,
    this.store
  );
}