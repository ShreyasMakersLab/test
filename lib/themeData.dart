import 'package:flutter/material.dart';

Color _PrimaryColor = Color(0xFF18A558);

ThemeData AppThemeData = ThemeData(
  primaryColor: _PrimaryColor,
  accentColor: Color(0xFF008827),
  fontFamily: "Poppins",

  //AppBar Theme
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        size: 24,
        color: Colors.white,
      ),
      color: _PrimaryColor,
      textTheme:
          TextTheme(headline1: TextStyle(fontSize: 24.0, color: Colors.white))),
  scaffoldBackgroundColor: Color(0xFFF1F1F1),

  //Text Theme
  textTheme: TextTheme(
      headline2: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
          color: Color(0xFF008827)),
      headline3: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
        color: Color(0xB3000000),
      ),
      headline4: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w200,
          color: Color(0x99000000),
          fontFamily: "Poppins Regular"),
      headline5: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w100, color: Colors.black54)),
);
