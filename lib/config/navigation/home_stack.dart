import 'package:flutter/material.dart';
import 'package:movie_booking/modules/home/screens/home.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
        });
  }
}
