import 'package:foodloop/Entities/recipe_entity.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_recipe_service.dart';
import 'package:foodloop/ServiceAdapters/Interface/recipe_service.dart';

class RecipeModel {
  RecipeServiceAdapter recipeService = FbRecipeServiceAdapter();

  Future<Recipe?> getRecipeById(String id) {
    return recipeService.getRecipeById(id);
  }

  Future<List<Recipe>> getRecipes() {
    return recipeService.getRecipes();
  }
}
