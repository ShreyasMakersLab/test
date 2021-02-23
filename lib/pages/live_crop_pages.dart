import 'package:crop_planning_techm/pages/calendar_view.dart';
import 'package:crop_planning_techm/pages/crop_profile.dart';
import 'package:crop_planning_techm/services/weather_api_service.dart';
import 'package:crop_planning_techm/widgets/weather_card.dart';
import 'package:flutter/material.dart';


class LiveCropPage extends StatefulWidget {
  @override
  _LiveCropPageState createState() => _LiveCropPageState();
}

class _LiveCropPageState extends State<LiveCropPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 90,
        flexibleSpace: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48, right: 16, left: 16),
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
                            text: "Sumit!",
                            style: Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: Color(0xB3000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins Regular",
                                    fontSize: 40),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      child: Image(
                        image: AssetImage('images/profile_avatar.png'),
                        height: MediaQuery.of(context).size.width / 8,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: Row(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 16),
              //         child: Text(
              //           "It might rain today ",
              //           style: Theme.of(context).textTheme.headline4,
              //         ),
              //       ),
              //       Image(
              //         image: AssetImage('images/rain.png'),
              //         height: MediaQuery.of(context).size.width / 8,
              //       ),
              //     ],
              //   ),
              // )
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
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WeatherCard(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CropProfile()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(Icons.schedule_rounded,
                                      size: 28, color: Colors.black54),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "5 Days to go for ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                    TextSpan(
                                        text: "Harvesting",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3)
                                  ]),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          cropCardInfo(
                              context,
                              "https://images.unsplash.com/photo-1506917728037-b6af01a7d403?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
                              "Pumpkin")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CropProfile()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(Icons.schedule_rounded,
                                      size: 28, color: Colors.black54),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "10 Days to go for ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                    TextSpan(
                                        text: "Ploughing",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3)
                                  ]),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          cropCardInfo(
                              context,
                              "https://images.unsplash.com/photo-1536500576323-b9a2af3a6c61?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                              "Tomato")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget cropCardInfo(BuildContext context, String crop_image_url, String cropName) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '$cropName\n',
                      style: Theme.of(context).textTheme.headline2),
                  TextSpan(
                      text: 'Farm 1\n',
                      style: Theme.of(context).textTheme.headline4),
                  TextSpan(
                      text: 'Flowering Stage\n',
                      style: Theme.of(context).textTheme.headline4),
                  TextSpan(
                      text: '3 days',
                      style: Theme.of(context).textTheme.headline4),
                ])),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      crop_image_url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 16, right: 8),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalendarViewPage()));
                    },
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.date_range,
                            size: 24,
                            color: Colors.white,
                          ),
                          Text(
                            'Show',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, right: 16, left: 8),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CropProfile()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black87,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 24,
                            color: Colors.black87,
                          ),
                          Text(
                            'Edit',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        )
      ],
    ),
  );
}

