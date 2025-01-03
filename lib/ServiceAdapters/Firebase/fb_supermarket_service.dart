import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodloop/ServiceAdapters/Interface/supermarket_service.dart';
import 'package:foodloop/Entities/supermarket_entity.dart';

class FbSupermarketService implements SuperMarketService {

  final CollectionReference superCollection = FirebaseFirestore.instance.collection("supermarkets");

  static Supermarket supermarketFromJson(Map json) {
    try {
      return Supermarket(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        address: json["address"],
        latitude: double.parse(json["latitude"].toString()),
        longitude: double.parse(json["length"].toString())
      );
    } on Exception catch (e) {
      throw Exception("Unable to parse supermarket $json. ${e.toString()}");
    } catch(e) {
      throw Exception("Unable to parse supermarket $json");
    }
  }

  @override
  Future<List<Supermarket>> getSupermarkets() async {
    List<Supermarket> supers = (await superCollection.get()).docs.map<Supermarket>((doc) {
      String id = doc.id;
      Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
      data["id"] = id;
      Supermarket sup = supermarketFromJson(data);
      return sup;
    }).toList();

    return supers;
  }
}