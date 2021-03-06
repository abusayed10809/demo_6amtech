import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {


  @override
  Widget build(BuildContext context) {
    final globalFontSize = MediaQuery.of(context).textScaleFactor;

    return Container(
      child: Center(
        child: Text(
          'Menu Page',
          style: TextStyle(
            fontSize: globalFontSize*20,
          ),
        ),
      ),
    );
  }
}
