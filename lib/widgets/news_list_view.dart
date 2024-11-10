import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: NewsTile(
            articleModel: articles[index],
          ),
        ),
      ),
    );
  }
}
