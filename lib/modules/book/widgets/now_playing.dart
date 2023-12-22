import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking/modules/book/widgets/now_playing_card.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  List<dynamic> movies = [];
  String image = 'https://image.tmdb.org/t/p/w130_and_h195_bestv2';
  Future<void> fetchMovies() async {
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
                  'image': image + movie['poster_path'],
                  'date': movie['release_date'],
                  'rating': movie['vote_average'],
                  'language': movie['original_language'],
                  'originalTitle': movie['original_title'],
                  'overview': movie['overview']
                })
            .toList();
      }
      print(movies);
    } catch (e) {
      print('Ocurrio un erro  $e');
    }
  }

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

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
          child: Column(
              children: movies
                  .map((movie) => NowPlayingCard(
                        title: movie['title'],
                        image: movie['image'],
                        date: movie['date'],
                        rating: movie['rating'],
                        language: movie['language'],
                        originalTitle: movie['originalTitle'],
                        overview: movie['overview'],
                      ))
                  .toList()),
        ),
      ],
    );
  }
}
