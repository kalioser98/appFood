import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodloop/Entities/recipe_entity.dart';
import 'package:foodloop/ServiceAdapters/Interface/recipe_service.dart';

class FbRecipeServiceAdapter implements RecipeServiceAdapter {
  final CollectionReference recipesCollection =
      FirebaseFirestore.instance.collection("recipes");

  static Recipe recipeFromJson(Map<dynamic, dynamic> json) {
    try {
      return Recipe(
        json["name"],
        json["imageUrl"],
        json["time"],
        json["calories"],
        json["description"],
        json["products"],
      );
    } catch (e) {
      throw Exception("Unable to parse recipe $json");
    }
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes =
        (await recipesCollection.get()).docs.map<Recipe>((doc) {
      String id = doc.id;
      Map<dynamic, dynamic> data = doc.data() as Map<dynamic, dynamic>;
      data["id"] = id;
      return recipeFromJson(data);
    }).toList();

    return recipes;
  }

  @override
  Future<Recipe?> getRecipeById(String id) async {
    Map? dataObj = (await recipesCollection.doc(id).get()).data() as Map?;

    if (dataObj == null) {
      return null;
    }
    dataObj["id"] = id;
    Recipe recipe = recipeFromJson(dataObj);

    return recipe;
  }
}
