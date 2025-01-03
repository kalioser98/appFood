import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_user_service.dart';
import 'package:foodloop/ServiceAdapters/Interface/user_service.dart';
import 'package:foodloop/Entities/user_entity.dart';

class UserModel {
  UserServiceAdapter userService = FbUserServiceAdapter();

  Future<List<User>> getUsers() {
    return userService.getUsers();
  }

  Future<User?> getUserById(String id) {
    return userService.getUserById(id);
  }

  Future<List<Product>> getFavoritesByUserId(String id) {
    return userService.getFavoritesByUserId(id);
  }

  Future removeUserFavorite(String userId, Product fav) {
    return userService.removeUserFavorite(userId, fav);
  }

  Future addUserFavorite(String userId, Product fav) {
    return userService.addUserFavorite(userId, fav);
  }


}