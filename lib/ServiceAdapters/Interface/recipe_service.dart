import 'package:foodloop/Entities/recipe_entity.dart';
import 'package:foodloop/Entities/product_entity.dart';

abstract class RecipeServiceAdapter {
  Future<List<Recipe>> getRecipes();
  Future<Recipe?> getRecipeById(String id);

//Takes a list of products from the user and returns a list of recommended recipe entities that can be made with those products
//  Future<List<Recipe>> getRecommendedRecipes(List<Product> userProducts);
}
