import 'package:flutter/material.dart';
import 'package:test_6amtech/Models/AllCategory.dart';

class AllCategoryProvider with ChangeNotifier{
  List<AllCategory> allCategoryList = [];

  void addToAllCategoryList(AllCategory allCategory){
    allCategoryList.add(allCategory);
    notifyListeners();
  }
}