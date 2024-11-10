import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_services.dart';
import 'package:news/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Oops there was an error, please try later',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent[700],
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.grey[600],
                ),
              ),
            );
          }
        });
  }
}
