import 'file:///E:/Flutter_projects/crop_planning_techm/lib/widgets/dropdown.dart';
import 'package:crop_planning_techm/pages/SpecificDateView.dart';
import 'package:crop_planning_techm/pages/add_crop.dart';
import 'package:crop_planning_techm/pages/add_task.dart';
import 'package:crop_planning_techm/pages/calendar_view.dart';
import 'package:crop_planning_techm/pages/choose_crops.dart';
import 'package:crop_planning_techm/pages/crop_info.dart';
import 'package:crop_planning_techm/pages/crop_profile.dart';
import 'package:crop_planning_techm/pages/farmdetails.dart';
import 'package:crop_planning_techm/pages/live_crop_pages.dart';
import 'package:crop_planning_techm/pages/location_details.dart';
import 'package:crop_planning_techm/pages/personal_details.dart';
import 'package:crop_planning_techm/themeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Color _PrimaryColor = Color(0xFF18A558);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: _PrimaryColor,
          accentColor: Color(0xFF008827),
        fontFamily: "Poppins",

          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                size: 24,
                color: Colors.white,
              ),
            color: _PrimaryColor,
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 24.0, color: Colors.white)
            )
          ),
          scaffoldBackgroundColor: Color(0xFFF1F1F1),

          textTheme: TextTheme(
            headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, fontFamily: "Poppins", color:Color(0xFF008827)),
            headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500,fontFamily: "Poppins", color: Color(0xB3000000), ),
            headline4: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w200, color: Color(0x99000000), fontFamily: "Poppins Regular"),
              headline5: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w100, color: Colors.black54)
          ),

        ),
      home:PersonalDetails(),

    );
  }
}



// Transperency level
// 100% — FF
//
// 95% — F2
//
// 90% — E6
//
// 85% — D9
//
// 80% — CC
//
// 75% — BF
//
// 70% — B3
//
// 65% — A6
//
// 60% — 99
//
// 55% — 8C
//
// 50% — 80
//
// 45% — 73
//
// 40% — 66
//
// 35% — 59
//
// 30% — 4D
//
// 25% — 40
//
// 20% — 33
//
// 15% — 26
//
// 10% — 1A
//
// 5% — 0D
//
// 0% — 00
