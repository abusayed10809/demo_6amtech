import 'package:flutter/material.dart';
import 'package:test_6amtech/Models/BannerModel.dart';

class BannerProvider with ChangeNotifier{
  List<BannerModel> bannerList = [];

  void addToBannerList(BannerModel bannerModel){
    bannerList.add(bannerModel);
    notifyListeners();
  }
}