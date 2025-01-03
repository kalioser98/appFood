import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/Models/product_model.dart';
import 'package:foodloop/Models/user_model.dart';
import 'package:foodloop/States/favorites_list_state.dart';
import 'package:foodloop/States/product_detail_state.dart';

class ProductDetailViewModel {

  ProductModel prodModel = ProductModel();
  UserModel userModel = UserModel();
  bool _initialized = false;
  String? currUserId;
  ProductDetailState? prodState;
  FavoritesListState? favsState;
  String productId;

  ProductDetailViewModel(this.productId);


  void initialize({
    required ProductDetailState prodState,
    required FavoritesListState favsState,
    required String currentUserId
  }) {
    if (!_initialized) {
      _initialized = true;
      currUserId = currentUserId;
      this.prodState = prodState;
      this.favsState = favsState;
      updateStates();
    }
  }

  void updateStates() {
    prodModel.getProductById(productId).then((value) {
      prodState!.setProduct(value);
    });
    userModel.getFavoritesByUserId(currUserId!).then((value) {
      favsState!.setFavorites(value);
    });
  }

  bool isFavorite() {
    Product? prod = prodState!.getProduct();
    List<Product> favs = favsState!.getFavorites();
    if (prod != null) {
      for (var fav in favs) {
        if (fav.id == prod.id) {
          return true;
        }
      }
    }

    return false;
  }

  void toggleFavorite(Product prod) {
    favsState!.setLoading();
    if (isFavorite()) {
      userModel.removeUserFavorite(currUserId!, prod).then((value) {
        userModel.getFavoritesByUserId(currUserId!).then((value) {
          favsState!.setFavorites(value);
        });
      });
    } else {
      userModel.addUserFavorite(currUserId!, prod).then((value) {
        userModel.getFavoritesByUserId(currUserId!).then((value) {
          favsState!.setFavorites(value);
        });
      });
    }
  }
}