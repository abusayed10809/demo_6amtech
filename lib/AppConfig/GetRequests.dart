// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:test_6amtech/Models/AllCategory.dart';
//
// Dio dio = new Dio();
//
// Future _getAllCategoryItems() async{
//   try{
//     var url = "https://dev.6amtech.com/efood/api/v1/categories";
//     String imageUrlPrefix = "https://dev.6amtech.com/efood/storage/app/public/category";
//
//     var response = await dio.get(
//       url,
//     );
//     if(response.statusCode == 200 || response.statusCode==201){
//       List<dynamic> dynamicAllCategoryList = response.data;
//       for(int i=0;i<dynamicAllCategoryList.length;i++){
//         AllCategory allCategory = new AllCategory();
//         allCategory.id = dynamicAllCategoryList[i]["id"];
//         allCategory.name = dynamicAllCategoryList[i]["name"];
//         String imageSuffix = dynamicAllCategoryList[i]["image"];
//         allCategory.image = imageUrlPrefix+'/'+imageSuffix;
//
//
//         setState(() {
//           allCategoryList.add(allCategory);
//         });
//       }
//     }
//   }
//   catch(error){
//     print(error);
//   }
//   return [];
// }