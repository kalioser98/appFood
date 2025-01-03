import 'package:flutter/material.dart';
import 'package:foodloop/Entities/recipe_entity.dart';
import 'package:foodloop/Models/recipe_model.dart';

class RecipeViewModel extends ChangeNotifier {
  RecipeModel recipeModel = RecipeModel();
  List<Recipe> recipes = [];
  bool loading = true;

  RecipeViewModel() {
    getRecipes();
  }

  void getRecipes() {
    recipeModel.getRecipes().then((retrievedRecipes) {
      recipes = retrievedRecipes;
      loading = false;
      notifyListeners();
    }).catchError((error) {
      //  error
      // print("Error fetching recipes: $error");
      loading = false;
      notifyListeners();
    });
  }

  bool isLoading() {
    return loading;
  }

  Future<Recipe?> getRecipeById(String id) {
    return recipeModel.getRecipeById(id);
  }
}
