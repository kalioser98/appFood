import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodloop/views/utils/AppColor.dart';
import 'package:foodloop/views/widgets/fl_app_bar.dart';

class RecipeProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlAppBar(navState: Navigator.of(context)).appBar(),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: RecipeInfo(
                imageUrl:
                    'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
                title: 'Nombre de la receta',
                difficulty: 'Difficulty: High',
                calories: '300 kcal',
                time: '30 min',
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Most prepared recipes with this product',
                    style: TextStyle(color: AppColor.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 174,
            child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: sweetFoodRecommendationRecipe.length,
              padding: EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) {
                return SizedBox(width: 16);
              },
              itemBuilder: (context, index) {
                final recipe = sweetFoodRecommendationRecipe[index];
                return RecommendationRecipeCard(
                  imageUrl: recipe.imageUrl,
                  title: recipe.title,
                  calories: recipe.calories,
                  time: recipe.time,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String imageUrl;

  ProductImage({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: MediaQuery.of(context).size.height - 80,
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // Image
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class RecipeInfo extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String calories;
  final String time;
  final String difficulty;

  RecipeInfo(
      {required this.imageUrl,
      required this.title,
      required this.calories,
      required this.time,
      required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // la navegación
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Title
            Container(
              margin: EdgeInsets.only(bottom: 8),
              width: 95,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.primary,
              ),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),

            // Recipe Info Wrapper
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  height: 70,
                  width: 165,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.26),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Difficulty Text
                      Text(
                        difficulty,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 150 / 100,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'inter'),
                      ),
                      // Recipe Calories and Time
                      Row(
                        children: [
                          // SvgPicture.asset(
                          //   'assets/icons/fire-filled.svg', // ESTE ASSET NO EXISTE!
                          //   color: Colors.white,
                          //   width: 12,
                          //   height: 12,
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              calories,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.alarm, size: 12, color: Colors.white),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              time,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendationRecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String calories;
  final String time;

  RecommendationRecipeCard({
    required this.imageUrl,
    required this.title,
    required this.calories,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // la navegación
      },
      child: Container(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Photo
            Container(
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Recipe title
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 8),
              padding: EdgeInsets.only(left: 4),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'inter',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Recipe calories and time
            Container(
              child: Row(
                children: [
                  // SvgPicture.asset(
                  //   'assets/icons/fire-filled.svg', // ESTE ASSET NO EXISTE!
                  //   color: Colors.black,
                  //   width: 12,
                  //   height: 12,
                  // ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      calories,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.alarm,
                    size: 12,
                    color: Colors.black,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      time,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Recipe {
  final String imageUrl;
  final String title;
  final String calories;
  final String time;

  Recipe({
    required this.imageUrl,
    required this.title,
    required this.calories,
    required this.time,
  });
}

final List<Recipe> sweetFoodRecommendationRecipe = [
  Recipe(
    imageUrl:
        'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
    title: 'Título de la receta 1',
    calories: '300 kcal',
    time: '30 min',
  ),
  Recipe(
    imageUrl:
        'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
    title: 'Título de la receta 2',
    calories: '400 kcal',
    time: '25 min',
  ),
  Recipe(
    imageUrl:
        'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
    title: 'Título de la receta 2',
    calories: '400 kcal',
    time: '25 min',
  ),
  Recipe(
    imageUrl:
        'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
    title: 'Título de la receta 2',
    calories: '400 kcal',
    time: '25 min',
  ),
];
