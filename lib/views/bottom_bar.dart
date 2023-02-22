import 'package:flutter/material.dart';
import 'package:news_app/screens/discover.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/profile.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BottomNavigationBar(
          elevation: 8,
          currentIndex: index,
          iconSize: 25,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.pink[100],
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(left: 40),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                  icon: const Icon(Icons.home),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Discover.routeName);
                },
                icon: const Icon(Icons.search),
              ),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(right: 40),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Profile.routename);
                  },
                  icon: const Icon(Icons.person),
                ),
              ),
              label: 'profile',
            ),
          ]),
    );
  }
}
