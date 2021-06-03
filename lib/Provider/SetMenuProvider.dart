import 'package:flutter/material.dart';
import 'package:test_6amtech/Models/SetMenu.dart';

class SetMenuProvider with ChangeNotifier{
  List<SetMenu> setMenuList = [];

  void addSetMenu(SetMenu setMenu){
    setMenuList.add(setMenu);
    notifyListeners();
  }
}