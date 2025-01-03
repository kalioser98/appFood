import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/Entities/purchase_entity.dart';
import 'package:foodloop/ServiceAdapters/Interface/purchase_service.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_product_service.dart';
import 'package:intl/intl.dart';

class FbPurchaseServiceAdapter implements PurchaseServiceAdapter {
  final CollectionReference purchasesCollection =
      FirebaseFirestore.instance.collection("purchases");

  static Purchase purchaseFromJson(Map<dynamic, dynamic> json) {
    try {
      return Purchase(
        json["id"],
        (json["products"] as List<dynamic>)
            .map<Product>(
                (productJson) => FbProductService.productFromJson(productJson))
            .toList(),
        double.parse(json["discount"].toString()),
        double.parse(json["totalPrice"].toString()),
        json["purchaseDate"],
        double.parse(json["subtotal"].toString()),
        json["address"],
        json["cardNumber"],
        json["paymentMethod"],
        json["deliveryType"],
      );
    } catch (e) {
      throw Exception("Unable to parse purchase $json");
    }
  }

  @override
  Future<List<Purchase>> getPurchasesByUserId(String userId) async {
    List<Purchase> purchases =
        (await purchasesCollection.where("userId", isEqualTo: userId).get())
            .docs
            .map<Purchase>((doc) {
      String id = doc.id;
      Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
      data["id"] = id;
      return purchaseFromJson(data);
    }).toList();

    return purchases;
  }

  @override
  Future<Map<String, dynamic>> getPurchasesByMont(String userId) async {
    List<Purchase> purchases =
        (await purchasesCollection.where("userId", isEqualTo: userId).get())
            .docs
            .map<Purchase>((doc) {
      String id = doc.id;
      Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
      data["id"] = id;
      return purchaseFromJson(data);
    }).toList();
    Map<String, List<Purchase>> purchasesByMonth = {};

    for (Purchase purchase in purchases) {
      DateTime purchaseDateTime = DateTime.parse(purchase.purchaseDate);
      String month = DateFormat.MMMM().format(purchaseDateTime);

      if (!purchasesByMonth.containsKey(month)) {
        purchasesByMonth[month] = [];
      }

      purchasesByMonth[month]!.add(purchase);
      // print(purchasesByMonth);
    }
    Map<String, double> totalPurchasesByMonth = {};
    for (String month in purchasesByMonth.keys) {
      double totalMonthPrice = 0.0;
      for (Purchase purchase in purchasesByMonth[month]!) {
        totalMonthPrice += purchase.totalPrice;
      }

      totalPurchasesByMonth[month] = totalMonthPrice;
    }
    return totalPurchasesByMonth;
  }

  @override
  Future<List<Product>> getProductsPurchasedByUserId(String userId) async {
    List<Product> products = [];
    final purchases = await getPurchasesByUserId(userId);
    for (var purchase in purchases) {
      products.addAll(purchase.products);
    }
    return products;
  }

  @override
  Future<void> makePurchase(
      String userId,
      List<Product> products,
      String address,
      String cardNumber,
      String paymentMethod,
      String deliveryType) async {
    // la lógica para guardar la compra en Firebase
  }
}
