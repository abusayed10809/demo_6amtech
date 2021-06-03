import 'package:flutter/material.dart';
import 'package:test_6amtech/Models/PopularItems.dart';

class PopularItemProvider with ChangeNotifier{
  List<PopularItems> popularItemList = [];

  void addToPopularItemList(PopularItems popularItems){
    popularItemList.add(popularItems);
    notifyListeners();
  }
}