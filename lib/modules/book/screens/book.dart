import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  Future<void> fetchMovies() async {
    List<dynamic> movies = [];

    final dio = Dio();
    final String url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=enUS&page=1&sort_by=popularity.desc';
    final String token =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNTQ3MjZkZGFhMzUyMzEwMGE0MzI2NGQ4YzM5NzJiNyIsInN1YiI6IjVmZDZjYjgxNjJmMzM1MDAzZWZlMWM1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4eHwNPG5OCyMIYXrnBgN32GNX8KFO0SVqR4KZiKSXFU';

    try {
      print('fetching data');
      final Response response = await dio.get(url,
          options: Options(
            headers: {'Authorization': token, 'accept': 'application/json'},
          ));
      print(response);
      if (response.statusCode == 200) {
        movies = response.data['results']
            .map((movie) => {
                  'title': movie['title'],
                  'image': movie['poster_path'],
                  'date': movie['release_date'],
                  'rating': movie['vote_average'],
                })
            .toList();
      }
    } catch (e) {
      print('Ocurrio un erro  $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

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
                  const Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              hintTextDirection: TextDirection.ltr))),
                  IconButton(
                    onPressed: () {},
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
