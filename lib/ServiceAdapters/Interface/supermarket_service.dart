import 'package:foodloop/Entities/supermarket_entity.dart';

abstract class SuperMarketService {
  Future<List<Supermarket>> getSupermarkets();
}