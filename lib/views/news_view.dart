import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
    controller
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            isLoading = true;
          });
        },
        onPageFinished: (url) {
          setState(() {
            isLoading = false;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.articleModel.url));
  }

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
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(
                color: Colors.grey[600],
              ),
            )
        ],
      ),
    );
  }
}
