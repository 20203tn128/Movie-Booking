import 'package:flutter/material.dart';
import 'package:movie_booking/config/themes/colors_app.dart';
import 'package:movie_booking/modules/book/widgets/trending.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.darkblue,
      appBar: AppBar(
        title: const Text('Bookmark',
            style: TextStyle(
                fontWeight: FontWeight.normal, fontFamily: 'Poppins')),
        backgroundColor: ColorsApp.darkblue,
        elevation: 0,
      ),
      body: const Column(children: [Trending()]),
    );
  }
}
