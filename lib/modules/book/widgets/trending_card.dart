import 'package:flutter/material.dart';
import 'package:movie_booking/config/themes/colors_app.dart';

class TrendingCard extends StatelessWidget {
  final String title;
  final String image;
  final String date;
  final double rating;
  const TrendingCard(
      {super.key,
      required this.title,
      required this.image,
      required this.date,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.darkblue,
      elevation: 3,
      child: Column(
        children: [
          Image.asset(
            image,
            width: 150,
            height: 150,
          ),
          SizedBox(
            width: 150,
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: ColorsApp.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: ColorsApp.orange,
                  size: 15,
                ),
                Text(
                  rating.toString(),
                  style: TextStyle(color: ColorsApp.white, fontSize: 12),
                )
              ],
            ),
          ),
          Text(
            date,
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 12, color: ColorsApp.white),
          ),
        ],
      ),
    );
  }
}
