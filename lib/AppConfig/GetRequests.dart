import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_6amtech/Models/AllCategory.dart';
import 'package:test_6amtech/Models/BannerModel.dart';
import 'package:test_6amtech/Models/PopularItems.dart';
import 'package:test_6amtech/Models/SetMenu.dart';
import 'package:test_6amtech/Provider/AllCategoryProvider.dart';
import 'package:test_6amtech/Provider/BannerProvider.dart';
import 'package:test_6amtech/Provider/PopularItemProvider.dart';
import 'package:test_6amtech/Provider/SetMenuProvider.dart';

class GetRequests{
  Dio dio = new Dio();

  Future getAllCategoryItems(BuildContext context) async{
    try{
      var url = "https://dev.6amtech.com/efood/api/v1/categories";
      String imageUrlPrefix = "https://dev.6amtech.com/efood/storage/app/public/category";

      var response = await dio.get(
        url,
      );
      if(response.statusCode == 200 || response.statusCode==201){
        List<dynamic> dynamicAllCategoryList = response.data;
        for(int i=0;i<dynamicAllCategoryList.length;i++){
          AllCategory allCategory = new AllCategory();
          allCategory.id = dynamicAllCategoryList[i]["id"];
          allCategory.name = dynamicAllCategoryList[i]["name"];
          String imageSuffix = dynamicAllCategoryList[i]["image"];
          allCategory.image = imageUrlPrefix+'/'+imageSuffix;

          Provider.of<AllCategoryProvider>(context, listen: false).addToAllCategoryList(allCategory);
        }
      }
    }
    catch(error){
      print(error);
    }
    return [];
  }

  Future getAllSetMenuItems(BuildContext context) async{
    try{
      var url = "https://dev.6amtech.com/efood/api/v1/products/set-menu";
      String imageUrlPrefix = "https://dev.6amtech.com/efood/storage/app/public/product";

      var response = await dio.get(
        url,
      );
      if(response.statusCode == 200 || response.statusCode==201){
        List<dynamic> dynamicSetMenuList = response.data;
        for(int i=0;i<dynamicSetMenuList.length;i++){
          SetMenu setMenu = new SetMenu();
          setMenu.id = dynamicSetMenuList[i]["id"];
          setMenu.name = dynamicSetMenuList[i]["name"];
          setMenu.price = dynamicSetMenuList[i]["price"];
          List<dynamic> rating = dynamicSetMenuList[i]["rating"];
          if(rating.length!=0){
            setMenu.rating = double.parse(rating[0]["average"]);
          }
          String imageUrlSuffix = dynamicSetMenuList[i]["image"];
          setMenu.image = imageUrlPrefix+'/'+imageUrlSuffix;

          Provider.of<SetMenuProvider>(context, listen: false).addSetMenu(setMenu);
        }
      }
    }
    catch(error){
      print(error);
    }
    return [];
  }

  Future getAllBannerItems(BuildContext context) async{
    try{
      var url = "https://dev.6amtech.com/efood/api/v1/banners";
      String imageUrlPrefix = "https://dev.6amtech.com/efood/storage/app/public/banner";

      var response = await dio.get(
        url,
      );
      if(response.statusCode == 200 || response.statusCode==201){
        List<dynamic> dynamicBannerList = response.data;
        for(int i=0;i<dynamicBannerList.length;i++){
          BannerModel banner = new BannerModel();
          banner.id = dynamicBannerList[i]["id"];
          String imageUrlSuffix = dynamicBannerList[i]["image"];
          banner.image = imageUrlPrefix+'/'+imageUrlSuffix;

          Provider.of<BannerProvider>(context, listen: false).addToBannerList(banner);
        }
      }
    }
    catch(error){
      print(error);
    }
    return [];
  }

  Future getAllProducts(BuildContext context) async{
    try{
      var url = "https://dev.6amtech.com/efood/api/v1/products/latest?limit=10&&offset=1";
      String imageUrlPrefix = "https://dev.6amtech.com/efood/storage/app/public/product";
      var response = await dio.get(
        url,
      );
      if(response.statusCode==200 || response.statusCode==201){
        Map<String, dynamic> data = response.data;
        List<dynamic> dynamicProductList = data["products"];
        for(int i=0;i<dynamicProductList.length; i++){
          PopularItems popularItems = new PopularItems();
          popularItems.id = dynamicProductList[i]["id"];
          popularItems.name = dynamicProductList[i]["name"];
          var price = dynamicProductList[i]["price"];
          if(price is double){
            popularItems.price = price.toInt();
          }
          else{
            popularItems.price = price;
          }
          String imageUrlSuffix = dynamicProductList[i]["image"];
          popularItems.image = imageUrlPrefix+'/'+imageUrlSuffix;

          Provider.of<PopularItemProvider>(context, listen: false).addToPopularItemList(popularItems);
        }
      }
    }
    catch(error){
      print(error);
    }
  }
}