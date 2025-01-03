import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/ServiceAdapters/Interface/product_service.dart';

class FbProductService implements ProductService {

  final CollectionReference prodCollection = FirebaseFirestore.instance.collection("products");

  static Product productFromJson(Map json) {
    try {
      return Product(
        json["id"],
        json["name"],
        json["description"],
        double.parse(json["price"].toString()),
        double.parse(json["discountPrice"].toString()),
        json["imageUrl"],
        json["expirationDate"],
        null
      );
    } catch(e) {
      inspect(e);
      throw Exception("Unable to parse product $json");
    }
  }

  static Map<String, dynamic> protuctToJson(Product prod) {
    Map<String, dynamic> prodJson = {
      "id": prod.id,
      "name": prod.name,
      "description": prod.description,
      "price": prod.price,
      "discountPrice": prod.discountPrice,
      "imageUrl": prod.imgUrl,
      "expirationDate": prod.expirationDate
    };

    return prodJson;
  }

  @override
  Future<List<Product>> getProducts() async {
    List<Product> prods = (await prodCollection.get()).docs.map<Product>((doc) {
      String id = doc.id;
      Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
      data["id"] = id;
      Product prod = FbProductService.productFromJson(data);
      return prod;
    }).toList();
    return prods;
  }

  @override
  Future<Product?> getProductById(String id) async {
    Map? dataObj = (await prodCollection.doc(id).get()).data() as Map?;

    if (dataObj == null) {
      return null;
    }
    dataObj["id"] = id;
    Product prod = productFromJson(dataObj);

    return prod;
  }
}