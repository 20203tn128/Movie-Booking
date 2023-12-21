import 'package:flutter/material.dart';
import 'package:movie_booking/config/themes/colors_app.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic rawArgumrnts = ModalRoute.of(context)!.settings.arguments;
    final Map<String, dynamic> arguments =
        (rawArgumrnts as Map<String, dynamic>?) ?? {};
    final title = arguments['title'] ?? '';
    final image = arguments['image'] ?? '';
    final date = arguments['date'] ?? '';
    final rating = arguments['rating'] ?? '';
    final language = arguments['language'] ?? '';
    final originalTitle = arguments['originalTitle'] ?? '';
    final overview = arguments['overview'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details',
            style: TextStyle(
                fontWeight: FontWeight.normal, fontFamily: 'Poppins')),
        backgroundColor: ColorsApp.darkblue,
        elevation: 0,
      ),
      body: Card(
        elevation: 3,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 150,
              height: 150,
            ),
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
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: ColorsApp.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
