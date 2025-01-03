import 'package:foodloop/Entities/product_entity.dart';

class Purchase {
  String id;
  List<Product> products;
  double discount;
  double totalPrice;
  String purchaseDate;
  double subtotal;
  String address;
  String cardNumber;
  String paymentMethod;
  String deliveryType;

  Purchase(
    this.id,
    this.products,
    this.discount,
    this.totalPrice,
    this.purchaseDate,
    this.subtotal,
    this.address,
    this.cardNumber,
    this.paymentMethod,
    this.deliveryType,
  );
}
