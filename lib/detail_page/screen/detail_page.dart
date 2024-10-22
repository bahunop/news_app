import 'package:flutter/material.dart';
import 'package:news_app/detail_page/screen/journal_page.dart';
import 'package:news_app/main_screen/widgets/topnews.dart';

class DetailWeather extends StatefulWidget {
  const DetailWeather({
    this.mainnews,
    super.key,
  });
  final String? mainnews;

  @override
  State<DetailWeather> createState() => _DetailWeatherState();
}

class _DetailWeatherState extends State<DetailWeather> {
  @override
  Widget build(BuildContext context) {
    var detailNews = ModalRoute.of(context)?.settings.arguments as TopNews;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail News',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          Image.asset(detailNews.journalpic),
          Text(detailNews.topic),
          Image.asset(detailNews.mainpic),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const JournalView()));
            },
            child: Text(detailNews.journal),
          )
        ],
      ),
    );
  }
}
