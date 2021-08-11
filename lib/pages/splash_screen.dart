import 'package:crop_planning_techm/pages/homepage.dart';
import 'package:crop_planning_techm/pages/user_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _username;
  String _password;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      authenticateUser();
      print(_username + _password);
    });
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
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

  authenticateUser() {
    if (_username != null && _password != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserLogin()));
    }
  }
}
