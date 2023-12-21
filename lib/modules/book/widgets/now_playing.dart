import 'package:flutter/material.dart';
import 'package:movie_booking/modules/book/widgets/now_playing_card.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'N o w  P l a y i n g',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: NowPlayingCard(
              title:
                  'Avengers asjkdhkajsdhfjsdagfhagdfjhgadkfjasdhfgsadkfjhasdhfkashdgfhasdgfkgasdfjgaksdfghj',
              image: 'assets/images/avengers.jpg',
              date: '2023-12-20',
              rating: 6.7,
            ),
          ),
        ),
      ],
    );
  }
}
