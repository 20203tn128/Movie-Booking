import 'package:flutter/cupertino.dart';
import 'package:movie_booking/config/themes/colors_app.dart';
import 'package:movie_booking/modules/book/widgets/trending_card.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'T R E N D I N G',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: ColorsApp.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TrendingCard(
                  title:
                      'Avengers asjkdhkajsdhfjsdagfhagdfjhgadkfjasdhfgsadkfjhasdhfkashdgfhasdgfkgasdfjgaksdfghj',
                  image: 'assets/images/avengers.jpg',
                  date: '2023-12-20',
                  rating: 6.7,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
