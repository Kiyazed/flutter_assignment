// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:news_app/model/blog.dart';
import 'package:http/http.dart' as http;

class News {
  List<BlogModel> news = [];
  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ffb5c1e66da34df68a2706780120abab");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          BlogModel blogs = BlogModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(blogs);
        }
      });
    }
  }
}

class NewsUs {
  final List<BlogModel> newsBlog = [];
  Future<void> getNewsUs() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2023-02-14&to=2023-02-14&sortBy=popularity&apiKey=ffb5c1e66da34df68a2706780120abab");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          BlogModel blogs = BlogModel(
            title: element['title'],
            author: element['author'] ?? ' ',
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'] ?? ' ',
          );
          print(blogs.title);
          print(blogs.description);
          print(blogs.author);
          print(blogs.content);
          print(blogs.urlToImage);
          print(blogs.url);
          newsBlog.add(blogs);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<BlogModel> newsBlogs = [];

  // ignore: recursive_getters
  get apiKey => apiKey;

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ffb5c1e66da34df68a2706780120abab");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          BlogModel blogs = BlogModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element['url'],
            // newsBlogsUrl: element["url"],
          );
          newsBlogs.add(blogs);
        }
      });
    }
  }
}
