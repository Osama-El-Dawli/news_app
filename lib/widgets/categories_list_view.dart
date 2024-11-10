import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
        categoryName: 'Entertainment', image: 'assets/entertaiment.avif'),
    CategoryModel(categoryName: 'Technology', image: 'assets/technology.jpeg'),
    CategoryModel(categoryName: 'Science', image: 'assets/science.avif'),
    CategoryModel(categoryName: 'Business', image: 'assets/business.avif'),
    CategoryModel(categoryName: 'Health', image: 'assets/health.avif'),
    CategoryModel(categoryName: 'Sports', image: 'assets/sports.avif'),
    CategoryModel(categoryName: 'General', image: 'assets/general.avif'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
