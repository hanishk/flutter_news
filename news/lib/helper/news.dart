import 'dart:convert';

import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=7c3807bbec3144bd907332a781a90c47";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((elements) {
        if (elements["urlToImage"] != null) {
          ArticleModel articleModel = new ArticleModel(
              title: elements['title'],
              author: elements['author'],
              description: elements["description"],
              url: elements["url"],
              urlToImage: elements["urlToImage"],
              content: elements["content"]);

          news.add(articleModel);
        }
      });
    }
  }
}
