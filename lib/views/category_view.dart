import 'package:flutter/material.dart';
import 'package:news/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'News',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Cloud',
            style: TextStyle(color: Colors.orange),
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [NewsListViewBuilder(category: category)],
        ),
      ),
    );
  }
}
