import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/Models/user_model.dart';
import 'package:foodloop/States/favorites_list_state.dart';

class FavoritesViewModel {

  final UserModel favModel = UserModel();
  String? currentUserId;
  FavoritesListState? favsState;
  bool _initialized = false;

  FavoritesViewModel();

  void initialize({
    required FavoritesListState favsState,
    required String currentUserId
  }) {
    if(!_initialized) {
      _initialized = true;
      this.favsState = favsState;
      this.currentUserId = currentUserId;
      updateStates();
    }
  }

  void updateStates() {
    favModel.getFavoritesByUserId(currentUserId!).then((value) {
      favsState!.setFavorites(value);
    });
  }

  void removeFavorite(Product prod) {
    favsState!.setLoading();
    favModel.removeUserFavorite(currentUserId!, prod).then((value) {
      favModel.getFavoritesByUserId(currentUserId!).then((value) {
        favsState!.setFavorites(value);
      });
    });
  }
}