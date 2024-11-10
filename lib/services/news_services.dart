import 'package:dio/dio.dart';
import 'package:news/models/article_model.dart';

class NewsServices {
  final Dio dio;

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apiKey=d9714dd18abc4db299e5ff8ff6a298ee&country=us&category=$category');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }

  NewsServices(this.dio);
}
