import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_booking/config/themes/colors_app.dart';
import 'package:movie_booking/modules/book/widgets/now_playing_card.dart';
import 'package:movie_booking/modules/book/widgets/trending.dart';
import 'package:movie_booking/modules/book/widgets/trending_card.dart';

import '../widgets/now_playing.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController _searchController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.grey[600],
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(children: [
                  Expanded(
                      child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              hintText: 'Search',
                              hintTextDirection: TextDirection.ltr))),
                  IconButton(
                    onPressed: () async {
                      final dio = Dio();
                      String url =
                          'https://api.themoviedb.org/3/search/movie?include_adult=false&page=1&query=avengers&language=en-US';
                      String nuevaUrl =
                          url + '&query=' + _searchController.text;
                      final String token =
                          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNTQ3MjZkZGFhMzUyMzEwMGE0MzI2NGQ4YzM5NzJiNyIsInN1YiI6IjVmZDZjYjgxNjJmMzM1MDAzZWZlMWM1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4eHwNPG5OCyMIYXrnBgN32GNX8KFO0SVqR4KZiKSXFU';

                      try {
                        print('fetching data');
                        final Response response = await dio.get(nuevaUrl,
                            options: Options(
                              headers: {
                                'Authorization': token,
                                'accept': 'application/json'
                              },
                            ));
                        print(response);
                        if (response.statusCode == 200) {
                          print(
                              'Estso son los resulatdos antes de asignarlos al movie');
                          print(response.data['results']);
                          final movie = response.data['results']
                              .map((movie) => {
                                    'title': movie['title'],
                                    'image':
                                        'https://image.tmdb.org/t/p/w130_and_h195_bestv2' +
                                            movie['poster_path'],
                                    'date': movie['release_date'],
                                    'rating': movie['vote_average'],
                                    'language': movie['original_language'],
                                    'originalTitle': movie['original_title'],
                                    'overview': movie['overview']
                                  })
                              .toList();
                          print(movie);
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 400,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        movie['image'],
                                        width: 150,
                                        height: 150,
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          movie['title'],
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
                                              movie['rating'].toString(),
                                              style: TextStyle(
                                                  color: ColorsApp.white,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        movie['date'],
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            color: ColorsApp.white),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'No se ha encontrado la pelicula'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'))
                                ],
                              );
                            });
                      }
                    },
                    icon: const Icon(Icons.search),
                  )
                ]),
              ),
            ),
          ),
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
      ),
    );
  }
}
