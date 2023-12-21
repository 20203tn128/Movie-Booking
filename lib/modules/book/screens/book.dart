import 'package:flutter/material.dart';
import 'package:movie_booking/config/themes/colors_app.dart';
import 'package:movie_booking/modules/book/widgets/now_playing_card.dart';
import 'package:movie_booking/modules/book/widgets/trending.dart';
import 'package:movie_booking/modules/book/widgets/trending_card.dart';

import '../widgets/now_playing.dart';

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
      body: const Column(children: [
        Trending(),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              NowPlaying(),
            ],
          ),
        )
      ]),
    );
  }
}
