import 'package:foodloop/ServiceAdapters/Firebase/fb_supermarket_service.dart';
import 'package:foodloop/ServiceAdapters/Interface/supermarket_service.dart';
import 'package:foodloop/Entities/supermarket_entity.dart';

class SupermarketModel {
  SuperMarketService supService = FbSupermarketService();

  Future<List<Supermarket>> getSupermarkets() {
    return supService.getSupermarkets();
  }
}