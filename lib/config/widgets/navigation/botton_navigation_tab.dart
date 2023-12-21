import 'package:flutter/material.dart';
import 'package:movie_booking/config/themes/colors_app.dart';

class BottomNavigationTab extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const BottomNavigationTab(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: ColorsApp.darkblue),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
            backgroundColor: ColorsApp.darkblue),
        BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Booking',
            backgroundColor: ColorsApp.darkblue),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: ColorsApp.darkblue),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: ColorsApp.orange,
      unselectedItemColor: ColorsApp.white,
      onTap: onItemTapped,
    );
  }
}
