import 'package:foodloop/Entities/supermarket_entity.dart';
import 'package:foodloop/Models/location_model.dart';
import 'package:foodloop/Models/product_model.dart';
import 'package:foodloop/Models/supermarket_model.dart';
import 'package:foodloop/States/location_state.dart';
import 'package:foodloop/States/product_list_state.dart';
import 'package:foodloop/States/supermarket_list_state.dart';

class HomeViewModel {

  ProductModel prodModel = ProductModel();
  SupermarketModel supModel = SupermarketModel();
  bool _initialized = false;
  ProductListState? prodsState;
  SupermarketListState? supersState;
  LocationState? locState;

  HomeViewModel();

  void initialize({
    required ProductListState prodsState,
    required SupermarketListState supersState,
    required LocationState locState
  }) {
    if(!_initialized) {
      _initialized = true;
      this.prodsState = prodsState;
      this.supersState = supersState;
      this.locState = locState;
      updateStates();
    }
  }
  
  void updateStates() {
    supModel.getSupermarkets().then((value) {
      supersState!.setSupermarkets(value);
    }).catchError((e) {
      supersState!.setError(true);
    }).then((_) => _updateLocation());
    prodModel.getProducts().then((value) {
      prodsState!.setProducts(value);
    }).catchError((e) {
      prodsState!.setError(true);
    });
  }

  void _updateLocation() {
    LocationModel.determinePosition()
      .then((pos) {
        locState!.setLocation(pos.latitude, pos.longitude);
        if(!supersState!.errorOcurred()) {
          List<Supermarket> sups = supersState!.getSupermarkets();
          sups.sort((sup1, sup2) {
            double dist1 = LocationModel.distanceBetween(
              pos.latitude, pos.longitude, sup1.latitude, sup1.longitude
            );
            double dist2 = LocationModel.distanceBetween(
              pos.latitude, pos.longitude, sup2.latitude, sup2.longitude
            );

            return (dist1 - dist2).sign.round();
          });

          supersState!.setSupermarkets(sups);
        }
      }).catchError((e) {
        locState!.setError();
      });
  }

  /// Returns the distance in meters between the super market
  /// and the devices's location or -1 if devices's location is
  /// not available
  double getDistanceFromSuperMarket(Supermarket sup) {
    double? lat1 = locState!.getLatitude();
    double? lon1 = locState!.getLongitude();

    if (lon1 != null && lat1 != null && !locState!.hasError()) {
        return LocationModel.distanceBetween(lat1, lon1, sup.latitude, sup.longitude);
    }

    return -1;
  }
}
