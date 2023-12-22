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
    print(language);
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
        color: ColorsApp.darkblue,
        elevation: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                image,
                width: 400,
                height: 200,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 320,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: ColorsApp.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 320,
                    child: Text(
                      'Original title: $originalTitle',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: ColorsApp.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      language == 'en'
                          ? 'Language: English '
                          : 'Language: Spanish',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: ColorsApp.white),
                    ),
                  ),
                ],
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 340,
                    child: Text(
                      overview,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: ColorsApp.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Release date: $date',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: ColorsApp.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
