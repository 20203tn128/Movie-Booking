import 'package:flutter/material.dart';
import 'package:movie_booking/config/themes/colors_app.dart';

class NowPlayingCard extends StatelessWidget {
  final String title;
  final String image;
  final String date;
  final double rating;
  final String language;
  final String originalTitle;
  final String overview;

  const NowPlayingCard(
      {super.key,
      required this.title,
      required this.image,
      required this.date,
      required this.rating,
      required this.language,
      required this.originalTitle,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: {
          'title': title,
          'image': image,
          'date': date,
          'rating': rating,
          'language': language,
          'originalTitle': originalTitle,
          'overview': overview
        });
      },
      child: Card(
        color: ColorsApp.darkblue,
        elevation: 3,
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(
                  image,
                  width: 150,
                  height: 150,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
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
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 20,
                      child: Icon(
                        Icons.bookmark,
                        color: ColorsApp.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(40, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.grey[700],
                            foregroundColor: Colors.white),
                        child: const Text('XLS'),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(40, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.grey[700],
                            foregroundColor: Colors.white),
                        child: const Text('XLS'),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(40, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.grey[700],
                            foregroundColor: Colors.white),
                        child: const Text('XLS'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
