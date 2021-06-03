import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    final globalFontSize = MediaQuery.of(context).textScaleFactor;

    return Container(
      child: Center(
        child: Text(
          'Cart Page',
          style: TextStyle(
            fontSize: globalFontSize*20,
          ),
        ),
      ),
    );
  }
}
