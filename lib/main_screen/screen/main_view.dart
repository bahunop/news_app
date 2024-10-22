import 'package:flutter/material.dart';
import 'package:news_app/main_screen/models/api_call.dart';
import 'package:news_app/main_screen/provider/news_provider.dart';
import 'package:news_app/main_screen/screen/bookmark_view.dart';
import 'package:news_app/main_screen/screen/genre_news.dart';
import 'package:news_app/main_screen/screen/other_news.dart';
import 'package:news_app/main_screen/widgets/genrenews.dart';
import 'package:provider/provider.dart';

class MainNews extends StatefulWidget {
  const MainNews({super.key});

  @override
  State<MainNews> createState() => _MainNewsState();
}

class _MainNewsState extends State<MainNews> {
  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<NewsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AUTUMN',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                alignment: Alignment.center,
                child: Text(
                  providerWatch.bookMarkArticle!.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookMarkView()));
                  },
                  icon: const Icon(Icons.bookmark_outline)),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: FutureBuilder(
                builder: (context, snapshot) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              color: Colors.red,
                              margin: const EdgeInsets.only(right: 15),
                              child: Image.network(
                                snapshot.data?[1].urlToImage ?? "",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    snapshot.data?[1].title ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data?[1].description ?? "",
                                    maxLines: 2,
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  const Text("BY:"),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    snapshot.data?[1].author ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: 1,
                  );
                },
                future: ApiReceive().fetchNews(),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const GenreNews(),
            const SizedBox(
              height: 18,
            ),
            const OtherNews()
          ],
        ),
      ),
    );
  }
}

List<TypeNews> filternews = [
  const TypeNews(
    type: 'games',
  ),
  const TypeNews(
    type: 'sports',
  ),
  const TypeNews(
    type: 'economics',
  ),
  const TypeNews(
    type: 'politics',
  ),
];
