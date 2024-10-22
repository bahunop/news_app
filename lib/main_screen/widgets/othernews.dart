import 'package:flutter/material.dart';

import '../models/api_call.dart';

class OtherNewsViewWidget extends StatelessWidget {
  const OtherNewsViewWidget({
    super.key,
    this.article,
    required this.bookMarkpressed,
    required this.ispressed,
  });
  final Articles? article;
  final bool ispressed;
  final VoidCallback bookMarkpressed;
  @override
  Widget build(BuildContext context) {
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
              article?.urlToImage ?? "",
              fit: BoxFit.fill,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  article?.title ?? "",
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  article?.description ?? "",
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
                  article?.author ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: bookMarkpressed,
                  icon:
                      Icon(ispressed ? Icons.bookmark : Icons.bookmark_outline))
            ],
          )
        ],
      ),
    );
  }
}
