import 'dart:ui';

import 'package:crop_planning_techm/pages/homepage.dart';
import 'package:crop_planning_techm/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _username;
  String _password;

  String _passwordError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Farm Planning - Login Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 40, bottom: 8),
                      child: Text("Username",
                          style: Theme.of(context).textTheme.headline2)),
                  TextFormField(
                    controller: usernameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                      hintText: 'Enter Your Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 18, bottom: 8),
                      child: Text('Password',
                          style: Theme.of(context).textTheme.headline2)),
                  TextFormField(
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (!validateStructure(value)) {
                        return "Password must contain uppercase letter, lowercase letter,\nnumber and symbol";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(14)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),

                      // padding: EdgeInsets.all(14),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),

                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (_username == usernameController.text &&
                              _password == passwordController.text) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Invalid Credentials")));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("All Fields are Required")));
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Center(
                      child: Text("Don't have an account",
                          style: Theme.of(context).textTheme.headline3),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalDetails()));
                    },
                    child: Center(
                        child: Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    )),
                  )
                ],
              ),
            )),
      ),
    );
  }

  _fetchUserData() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _username = prefs.getString("username");
      _password = prefs.getString("password");
    });
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
