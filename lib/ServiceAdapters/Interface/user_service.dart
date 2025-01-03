import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/Entities/user_entity.dart';

abstract class UserServiceAdapter {
  Future<List<User>> getUsers();
  Future<User?> getUserById(String id);
  Future<List<Product>> getFavoritesByUserId(String id);
  Future removeUserFavorite(String userId, Product fav);
  Future addUserFavorite(String userId, Product fav);
}