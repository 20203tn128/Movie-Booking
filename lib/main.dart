import 'package:flutter/material.dart';
import 'package:movie_booking/config/widgets/navigation/menu.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const Menu(),
      },
    );
  }
}
