import 'package:flutter/material.dart';
import 'package:movie_booking/config/navigation/book_stack.dart';
import 'package:movie_booking/config/navigation/home_stack.dart';
import 'package:movie_booking/config/widgets/navigation/botton_navigation_tab.dart';
import 'package:movie_booking/modules/book/screens/booking.dart';
import 'package:movie_booking/modules/profile/screens/profile.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;
  void _setItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomeStack(),
          const BookStack(),
          const Booking(),
          const Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationTab(
          onItemTapped: _setItem, selectedIndex: _selectedIndex),
    );
  }
}
