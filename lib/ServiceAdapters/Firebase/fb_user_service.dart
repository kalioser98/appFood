import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_product_service.dart';
import 'package:foodloop/ServiceAdapters/Interface/user_service.dart';
import 'package:foodloop/Entities/user_entity.dart';

class FbUserServiceAdapter implements UserServiceAdapter {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  static User userFromJson(Map<dynamic, dynamic> json) {
    try {
      return User(json["id"], json["name"], json["email"], json["password"]);
    } catch (e) {
      throw Exception("Unable to parse user $json");
    }
  }

  @override
  Future<List<User>> getUsers() async {
    List<User> users = (await usersCollection.get()).docs.map<User>((doc) {
      String id = doc.id;
      Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
      data["id"] = id;
      return userFromJson(data);
    }).toList();

    return users;
  }

  @override
  Future<User?> getUserById(String id) async {
    Map? dataObj = (await usersCollection.doc(id).get()).data() as Map?;

    if (dataObj == null) {
      return null;
    }
    dataObj["id"] = id;
    User user = userFromJson(dataObj);

    return user;
  }

  @override
  Future<List<Product>> getFavoritesByUserId(String id) async {
    CollectionReference favCollection =
        FirebaseFirestore.instance.collection("users/$id/favorites/");
    List<Product> favorites =
        (await favCollection.get()).docs.map<Product>((doc) {
      String id = doc.id;
      Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
      data["id"] = id;
      Product prod = FbProductService.productFromJson(data);
      return prod;
    }).toList();
    return favorites;
  }

  @override
  Future removeUserFavorite(String userId, Product fav) async {
    CollectionReference favCollection =
        FirebaseFirestore.instance.collection("users/$userId/favorites");
    await favCollection.doc(fav.id).delete();
  }

  @override
  Future addUserFavorite(String userId, Product fav) async {
    CollectionReference favCollection =
        FirebaseFirestore.instance.collection("users/$userId/favorites");
    Map favJson = FbProductService.protuctToJson(fav);
    await favCollection.doc(fav.id).set(favJson);
  }
}
