import 'package:foodloop/Entities/cart_product_entity.dart';
import 'package:foodloop/Entities/supermarket_entity.dart';

class Order {
  List<CartProduct> cartProducts;
  Supermarket store;
  String deliveryType;
  String deliveryAddress;
  double deliveryCost;
  String paymentType;
  String payCardInfo;
  double subtotal;
  double discount;
  double serviceCost;
  double total;

  Order(
    this.cartProducts,
    this.store,
    this.deliveryType,
    this.deliveryAddress,
    this.deliveryCost,
    this.paymentType,
    this.payCardInfo,
    this.subtotal,
    this.discount,
    this.serviceCost,
    this.total,
  );
}