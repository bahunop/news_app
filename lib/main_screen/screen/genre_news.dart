import 'package:flutter/material.dart';
import 'package:news_app/main_screen/screen/main_view.dart';

class GenreNews extends StatelessWidget {
  const GenreNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filternews.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(filternews[index].type),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 5,
          );
        },
      ),
    );
  }
}
