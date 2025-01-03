import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/Entities/purchase_entity.dart';
//import 'package:foodloop/Entities/RecipeEntity.dart';

abstract class PurchaseServiceAdapter {
  Future<List<Purchase>> getPurchasesByUserId(String userId);
  Future<List<Product>> getProductsPurchasedByUserId(String userId);
  Future<void> makePurchase(
      String userId,
      List<Product> products,
      String address,
      String cardNumber,
      String paymentMethod,
      String deliveryType);
  Future<Map<String,dynamic>> getPurchasesByMont(String userId);
}
