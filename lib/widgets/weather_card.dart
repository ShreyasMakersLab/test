import 'dart:convert';

import 'package:crop_planning_techm/Models/weather_model.dart';
import 'package:crop_planning_techm/services/weather_api_service.dart';



import 'package:flutter/material.dart';
import 'package:charcode/ascii.dart';

import 'package:charcode/html_entity.dart' show $deg;


class WeatherCard extends StatefulWidget {
  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final WeatherAPIService weatherData = WeatherAPIService();

  // var degree = ascii.decode([0x00B0]);



  @override
  Widget build(BuildContext context) {
    // print(degree.runtimeType);
    return FutureBuilder<WeatherModel>(
      future: weatherData.fetchData(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15.0),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8),
                      child: Text(
                        "Tuesday 28",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sunny",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Text(
                              "29℃",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(fontSize: 40),
                            ),
                            Text(
                              "Day 20℃ • Night 16℃",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(""),
                              Container(
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.wb_sunny_outlined,
                                  size: 54,
                                ),
                              ),
                              Text(
                                "Wind 14 kmph",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ])
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    constraints: BoxConstraints(
                      maxHeight: 130,
                      minHeight: 120
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        dailyTempWidget(context, "Mon",
                            Icons.wb_sunny_rounded, "18", "27"),
                        dailyTempWidget(context, "Tue",
                           Icons.wb_cloudy, "28", "27"),
                        dailyTempWidget(context, "Wed",
                            Icons.wb_shade, "9", "28"),
                        dailyTempWidget(context, "Thu",
                            Icons.wb_twighlight, "10", "37"),
                        dailyTempWidget(context, "Fri",
                            Icons.wb_sunny_rounded, "16", "27"),
                        dailyTempWidget(context, "Sat",
                            Icons.wb_sunny_rounded, "23", "21"),
                        dailyTempWidget(context, "Sun",
                            Icons.wb_sunny_rounded, "18", "27"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );

          // return Card(
          //   margin: EdgeInsets.symmetric(horizontal: 16),
          //   // color: Colors.pink,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15.0),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Container(
          //               child: Row(
          //                 children: [
          //                   Text('Tuseday 28',style: Theme.of(context)
          //                   .textTheme
          //                   .headline4),
          //                   IconButton(
          //                       icon: Icon(
          //                         Icons.arrow_drop_down_circle_outlined,
          //                       ),
          //                       onPressed: null)
          //                 ],
          //               ),
          //             ),
          //             Text("${snapshot.data.weather[0].description}",style: Theme.of(context)
          //                 .textTheme
          //                 .headline4),
          //           ],
          //         ),
          //         Divider(
          //           thickness: 1,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               '${snapshot.data.main.temp}',
          //               style: TextStyle(
          //                 fontSize: 64,
          //               ),
          //             ),
          //             Icon(
          //               Icons.wb_sunny,
          //               size: 78,
          //             ),
          //           ],
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(top:4),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text('${snapshot.data.main.temp_min}'
          //                   '/'
          //                   '${snapshot.data.main.temp_max}',style: Theme.of(context)
          //                   .textTheme
          //                   .headline4),
          //               Text('Wind ${snapshot.data.wind.speed} kmph',style: Theme.of(context)
          //                   .textTheme
          //                   .headline4),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );

          // return Column(
          //   children: [
          //     Text("${snapshot.data.main.temp}"),
          //     Text("${snapshot.data.main.temp_max}"),
          //     Text("${snapshot.data.main.temp_min}"),
          //     Text("${snapshot.data.main.humidity}"),
          //     Text("${snapshot.data.weather[0].main}"),
          //     Text("${snapshot.data.weather[0].description}"),
          //   ],
          // );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}

Widget dailyTempWidget(BuildContext context, String day, IconData weatherIcon,
    String minTemp, String maxTemp) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal:8.0,),
      decoration: BoxDecoration(
      // color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(30),),
        child: Column(
          children: [
            Text(
              "${day}",
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,),
              child: Icon(weatherIcon, size: 40,),
            ),
            Text("${minTemp}/${maxTemp}℃", style: Theme.of(context).textTheme.headline3.copyWith(
              fontSize: 14
            ),)
          ],
        ),
      ),
  );

}
