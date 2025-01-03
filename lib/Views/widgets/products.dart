import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

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

// Supermarkets
class Supermarkets extends StatelessWidget {
  final String imageUrl;
  final String title;

  Supermarkets({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // la navegación
      },
      child: Container(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Photo
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
