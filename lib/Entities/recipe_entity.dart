import 'package:foodloop/Entities/product_entity.dart';

class Recipe {
  String name;
  String imageUrl;
  String description;
  String time;
  String calories;
  List<Product> products;

  Recipe(this.name, this.imageUrl, this.time, this.calories, this.description,
      this.products);
}
