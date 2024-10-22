import 'package:flutter/material.dart';
import 'package:news_app/main_screen/provider/news_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/othernews.dart';

class OtherNews extends StatefulWidget {
  const OtherNews({super.key});

  @override
  State<OtherNews> createState() => _OtherNewsState();
}

class _OtherNewsState extends State<OtherNews> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<NewsProvider>(builder: (context, provider, _) {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return OtherNewsViewWidget(
              article: provider.newsArticle?[index],
              bookMarkpressed: () {
                provider.markedList(provider.newsArticle?[index]);
              },
              ispressed: false,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: provider.newsArticle?.length ?? 0,
        );
      }),
    );
  }
}

/*FutureBuilder(
        future: _apiReceive.fetchNews(),
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
                        snapshot.data?[index].urlToImage ?? "",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            snapshot.data?[index].title ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data?[index].description ?? "",
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
                            snapshot.data?[index].author ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
            itemCount: snapshot.data?.length ?? 10,
          );
        },
      ),*/
