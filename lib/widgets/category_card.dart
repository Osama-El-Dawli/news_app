import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryView(
              category: category.categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 120,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(category.image),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Text(
            category.categoryName,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
