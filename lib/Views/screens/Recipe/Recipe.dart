import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodloop/views/utils/AppColor.dart';
import 'package:foodloop/views/widgets/list_products.dart';
import 'package:foodloop/views/widgets/fl_app_bar.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlAppBar flAppBar = FlAppBar(
      bgColor: AppColor.primary,
      actions: [],
    );
    return Scaffold(
      appBar: flAppBar.appBar(),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Category
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: MediaQuery.of(context).size.width,
            height: 305,
            color: AppColor.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your favorite recipes',
                    style: TextStyle(
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(255, 255, 255, 1))),
                SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    CategoryCard(
                        title: 'Healthy',
                        imageUrl:
                            'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp'),
                    CategoryCard(
                        title: 'Healthy',
                        imageUrl:
                            'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp'),
                    CategoryCard(
                        title: 'Healthy',
                        imageUrl:
                            'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp'),
                    CategoryCard(
                        title: 'Healthy',
                        imageUrl:
                            'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp'),
                    CategoryCard(
                        title: 'Healthy',
                        imageUrl:
                            'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp'),
                    CategoryCard(
                        title: 'Healthy',
                        imageUrl:
                            'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp'),
                  ],
                ),
              ],
            ),
          ),
          // Section 2 - Products
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search about recipes you can do with these ingredients',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 14,
                    color: AppColor.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                ProductTitle(
                  imageUrl:
                      'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
                  title: 'Product Title',
                ),
                SizedBox(height: 10),
                ProductTitle(
                  imageUrl:
                      'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
                  title: 'Product Title',
                ),
                SizedBox(height: 10),
                ProductTitle(
                  imageUrl:
                      'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
                  title: 'Product Title',
                ),
                SizedBox(height: 10),
                ProductTitle(
                  imageUrl:
                      'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
                  title: 'Product Title',
                ),
                SizedBox(height: 10),
                ProductTitle(
                  imageUrl:
                      'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
                  title: 'Product Title',
                ),
                SizedBox(height: 10),
                ProductTitle(
                  imageUrl:
                      'https://cdn.colombia.com/gastronomia/2011/08/25/lasagna-3685.webp',
                  title: 'Product Title',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  CategoryCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 24,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // Image
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.30)),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'inter'),
        ),
      ),
    );
  }
}
