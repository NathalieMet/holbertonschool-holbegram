import 'package:flutter/material.dart';
import 'package:holbegram/utils/posts.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logo.webp',
                  height: 10,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Holbegram',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    //
                  },
                  icon: const Icon(Icons.add, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    //
                  },
                  icon: const Icon(Icons.chat, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
      body: const Posts(), // Placeholder widget to be implemented
    );
  }
}
