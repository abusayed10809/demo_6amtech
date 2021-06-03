import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_6amtech/AppConfig/AppConfig.dart';
import 'package:test_6amtech/Screens/MainNavigation/NavigationMain.dart';
import 'package:test_6amtech/Widgets/Widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AppConfig _appConfig = new AppConfig();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  Dio dio = new Dio();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final globalFontSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'SignUp',
          style: TextStyle(fontSize: globalFontSize * 15),
        ),
      ),
      body: loading==true? Center(
        child: CircularProgressIndicator(),
      )
      : Container(
        width: width,
        height: height * 0.9,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: hintTextInputDecoration('First Name'),
                        style: TextStyle(
                          fontSize: globalFontSize * 15,
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        controller: _firstNameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'First Name cannot be empty.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      TextFormField(
                        decoration: hintTextInputDecoration('Last Name'),
                        style: TextStyle(
                          fontSize: globalFontSize * 15,
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        controller: _lastNameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Last Name cannot be empty.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      TextFormField(
                        decoration: hintTextInputDecoration('Phone'),
                        style: TextStyle(
                          fontSize: globalFontSize * 15,
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Phone number cannot be empty.';
                          } else if (value.length != 11) {
                            return 'Phone number should have 11 digits';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      TextFormField(
                        decoration: hintTextInputDecoration('Email'),
                        style: TextStyle(
                          fontSize: globalFontSize * 15,
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        controller: _emailController,
                        validator: (value) {
                          bool valid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!valid) {
                            return "Please enter correct email format.";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      TextFormField(
                        decoration: hintTextInputDecoration('Password'),
                        style: TextStyle(
                          fontSize: globalFontSize * 15,
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value.length < 6) {
                            return 'Password must be at least 6 letters.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () async{
                          setState(() {
                            loading = true;
                          });
                          int response = await _signUpWithEmailPassword();
                          setState(() {
                            loading = false;
                          });
                          if(response==200 || response==201){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationMain()));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.deepOrange[700],
                                  Colors.deepOrangeAccent,
                                ]
                            ),
                            borderRadius: BorderRadius.circular(width*0.1),
                          ),
                          width: width,
                          height: height*0.06,
                          child: AutoSizeText(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: globalFontSize*12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<int> _signUpWithEmailPassword() async{
    if(_formKey.currentState.validate()){
      String firstName = _firstNameController.text.trim();
      String lastName = _lastNameController.text.trim();
      String phone = _phoneController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      try{
        var url = "https://dev.6amtech.com/efood/api/v1/auth/register";

        FormData formData = new FormData.fromMap({
          _appConfig.firstName: firstName,
          _appConfig.lastName: lastName,
          _appConfig.phone: phone,
          _appConfig.email: email,
          _appConfig.password: password,
        });

        var response = await dio.post(
          url,
          data: formData,
        );

        if(response.statusCode==200 || response.statusCode==201){
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          await sharedPreferences.setString("email", email);
        }
        return response.statusCode;
      }
      catch(error){
        print(error);
      }
    }
  }
}
