import 'package:flutter/material.dart';
import 'package:test_6amtech/Screens/MainNavigation/NavigationPages/CartPage.dart';
import 'package:test_6amtech/Screens/MainNavigation/NavigationPages/FavouritePage.dart';
import 'package:test_6amtech/Screens/MainNavigation/NavigationPages/MenuPage.dart';

import 'NavigationPages/HomePage.dart';

class NavigationMain extends StatefulWidget {
  @override
  _NavigationMainState createState() => _NavigationMainState();
}

class _NavigationMainState extends State<NavigationMain> {

  int _currentIndex = 0;
  static final List<Widget> _pageWidgets = [
    HomePage(),
    CartPage(),
    FavouritePage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pageWidgets[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: bottomNavTap,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
  void bottomNavTap(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
