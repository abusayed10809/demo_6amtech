import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

InputDecoration hintTextInputDecoration(String hintText){
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.black26,
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent)
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent)
      ),
  );
}

Widget homePageHeader(BuildContext context){
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final globalFontSize = MediaQuery.of(context).textScaleFactor;
  return Container(
    color: Colors.white,
    width: width,
    height: height * 0.2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height * 0.06,
          width: width,
          color: Colors.deepOrangeAccent,
          alignment: Alignment.center,
          child: AutoSizeText(
            'Restaurant is close now, will open at 9:00 a.m.',
            style: TextStyle(
              fontSize: globalFontSize * 11,
            ),
          ),
        ),
        Container(
          height: height * 0.08,
          width: width,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03),
                child: Icon(
                  Icons.delivery_dining,
                  color: Colors.black,
                  size: width * 0.1,
                ),
              ),
              AutoSizeText(
                'eFood',
                style: TextStyle(
                    fontSize: globalFontSize * 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: width * 0.1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height * 0.06,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Container(
              alignment: Alignment.center,
              color: Colors.black12,
              child: TextField(
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: globalFontSize * 12,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: width * 0.07,
                    color: Colors.black,
                  ),
                  suffixIcon: Icon(
                    Icons.tune,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}