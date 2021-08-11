import 'package:crop_planning_techm/Models/UserDataModels/crop_data.dart';
import 'package:crop_planning_techm/pages/calendar_view.dart';
import 'package:crop_planning_techm/pages/choose_crops.dart';
import 'package:crop_planning_techm/pages/today_task.dart';
import 'package:crop_planning_techm/pages/user_login.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:crop_planning_techm/widgets/CrpCardInfoWidget.dart';
import 'package:crop_planning_techm/widgets/settings_page.dart';
import 'package:crop_planning_techm/widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _username;
  String _password;
  List<CropModel> _crops;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    authenticateUser();

    _fetchCropFromDB();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(milliseconds: 500), () async {
    //   authenticateUser();
    // });
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Prajwal Padal",
                style: Theme.of(context).textTheme.headline3,
              ),
              accountEmail: Text(
                "prajwalpadal@gmail.com",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80,
        flexibleSpace: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello, ",
                            style: Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: Color(0x99000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins Regular",
                                    fontSize: 24),
                          ),
                          TextSpan(
                            text: _username,
                            style: Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: Color(0xB3000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins Regular",
                                    fontSize: 32),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 60, bottom: 8),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CalendarViewPage()));
                          },
                          icon: Icon(
                            Icons.date_range,
                            size: 32,
                          )),
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: CircleAvatar(
                          child: Image(
                            image: AssetImage('images/profile_avatar.png'),
                            height: MediaQuery.of(context).size.width / 8.5,
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
      floatingActionButton: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        radius: 32,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.add,
            size: 48,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CropDetails()));
          },
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WeatherCard(),
              TodaysTasks(
                currDate:
                    DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
              ),
              _crops != null
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _crops.length,
                      itemBuilder: (BuildContext context, int i) {
                        return CropCard(cropData: _crops[i]);
                      })
                  : Container(
                      child: Text("Unable to fetch Data"),
                    )
            ],
          ),
        ),
      ),
    );
  }

  _fetchCropFromDB() async {
    final taskDBHelper = TaskDBHelper.instance;

    List<CropModel> crops = await taskDBHelper.fetchCrops();
    setState(() {
      _crops = crops;
    });
    print(_crops[0].cropName);
    print("crops fetched");
  }

  // _fetchUserData() async {
  //   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     _username = prefs.getString("username");
  //     _password = prefs.getString("password");
  //   });
  //   print("name:- " + _username);
  // }
  //

  authenticateUser() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _username = prefs.getString("username");
      _password = prefs.getString("password");
    });
    print({"In Authenticate $_username $_password"});
    if (_username != null) {
      return null;
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserLogin()));
    }
  }
}
