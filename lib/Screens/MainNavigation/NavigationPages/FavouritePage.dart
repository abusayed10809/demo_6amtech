import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final globalFontSize = MediaQuery.of(context).textScaleFactor;
    return Container(
      child: Center(
        child: Text(
          'Favourite Page',
          style: TextStyle(
            fontSize: globalFontSize*20,
          ),
        ),
      ),
    );
  }
}
