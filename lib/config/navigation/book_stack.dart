import 'package:flutter/material.dart';
import 'package:movie_booking/modules/book/screens/book.dart';

class BookStack extends StatelessWidget {
  const BookStack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/book',
        routes: {
          '/book': (context) => const Book(),
          '/detail': (context) => const Book(),
        });
  }
}
