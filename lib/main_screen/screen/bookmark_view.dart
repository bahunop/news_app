import 'package:flutter/material.dart';
import 'package:news_app/main_screen/provider/news_provider.dart';
import 'package:provider/provider.dart';

class BookMarkView extends StatefulWidget {
  const BookMarkView({super.key});

  @override
  State<BookMarkView> createState() => _BookMarkViewState();
}

class _BookMarkViewState extends State<BookMarkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<NewsProvider>(builder: (context, provider, _) {
        return Column(
          children: [Text(provider.bookMarkArticle.toString())],
        );
      }),
    );
  }
}
