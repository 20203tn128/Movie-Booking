import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_booking/config/themes/colors_app.dart';
import 'package:movie_booking/modules/book/widgets/trending_card.dart';

class Trending extends StatefulWidget {
  const Trending({
    super.key,
  });

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List<dynamic> movies = [];
  String image = 'https://www.themoviedb.org/t/p/w130_and_h195_bestv2';
  Future<void> fetchMovies() async {
    final dio = Dio();
    final String url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=enUS&page=1&sort_by=popularity.desc';
    final String token =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNTQ3MjZkZGFhMzUyMzEwMGE0MzI2NGQ4YzM5NzJiNyIsInN1YiI6IjVmZDZjYjgxNjJmMzM1MDAzZWZlMWM1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4eHwNPG5OCyMIYXrnBgN32GNX8KFO0SVqR4KZiKSXFU';

    try {
      print('fetching data');
      print('Si esta aqui');
      final Response response = await dio.get(url,
          options: Options(
            headers: {'Authorization': token, 'accept': 'application/json'},
          ));
      print(response);
      if (response.statusCode == 200) {
        print(response.statusCode);
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
      print('Debio de imprimir el response aqui en trending');
      print(movies);
      print('Esta es la direccion de la imagen');
      print(image);
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
                mainAxisSize: MainAxisSize.min,
                children: movies
                    .map((movie) => TrendingCard(
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
        )
      ],
    );
  }
}
