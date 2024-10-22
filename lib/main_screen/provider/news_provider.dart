import 'package:flutter/material.dart';

import '../models/api_call.dart';

class NewsProvider extends ChangeNotifier {
  List<Articles>? newsArticle = [];
  List<Articles>? bookMarkArticle = [];
  bool isloading = false;
  final ApiReceive _apiReceive = ApiReceive();

  void getArticleList() async {
    try {
      isloading = true;
      newsArticle = await _apiReceive.fetchNews();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void markedList(Articles? articles) {
    var ispresent =
        bookMarkArticle?.any((element) => element.title == articles?.title);
    if (articles != null) {
      if (ispresent!) {
        bookMarkArticle?.remove(articles);
      } else {
        bookMarkArticle?.add(articles);
      }
    }

    notifyListeners();
  }
}
