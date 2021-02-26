import 'package:crop_planning_techm/pages/personal_details.dart';
import 'package:crop_planning_techm/themeData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Planning Tool',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData,
      //This is entry point for any page in view.
      home: PersonalDetails(),
    );
  }
}
