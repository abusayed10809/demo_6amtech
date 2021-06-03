import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_6amtech/Screens/MainNavigation/NavigationMain.dart';
import 'package:test_6amtech/Screens/SignUpPage.dart';



SharedPreferences sharedPreferences;
String email = "";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();
  email = sharedPreferences.getString("email");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      home: email==null? SignUpPage() : NavigationMain(),
    );
  }
}

