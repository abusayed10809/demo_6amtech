import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_6amtech/AppConfig/GetRequests.dart';
import 'package:test_6amtech/Provider/AllCategoryProvider.dart';
import 'package:test_6amtech/Provider/BannerProvider.dart';
import 'package:test_6amtech/Provider/PopularItemProvider.dart';
import 'package:test_6amtech/Provider/SetMenuProvider.dart';
import 'package:test_6amtech/Screens/MainNavigation/NavigationMain.dart';
import 'package:test_6amtech/Screens/MainNavigation/NavigationPages/HomePage.dart';
import 'package:test_6amtech/Screens/SignUpPage.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllCategoryProvider()),
        ChangeNotifierProvider(create: (_) => SetMenuProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => PopularItemProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    GetRequests().getAllCategoryItems(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
                title: TextStyle(
                    color: Colors.black
                )
            ),
            centerTitle: true,
            iconTheme: IconThemeData(
                color: Colors.black
            )
        ),
      ),
      home: SignUpPage(),
    );
  }
}

