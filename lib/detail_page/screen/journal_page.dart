import 'package:flutter/material.dart';

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    color: Colors.black,
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/forest.jpg',
                        ),
                        fit: BoxFit.fill)),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "change picture",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
