import 'package:crop_planning_techm/Models/weather_model.dart';
import 'package:crop_planning_techm/services/weather_api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatefulWidget {
  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final WeatherAPIService weatherData = WeatherAPIService();

  @override
  Widget build(BuildContext context) {
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
                        "${DateFormat.yMMMMd('en_US').format(DateTime.now())}  ",
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
                              "${snapshot.data.weather[0].description.capitalize()}",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Text(
                              "${snapshot.data.main.temp}℃",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(fontSize: 40),
                            ),
                            Text(
                              "Day ${snapshot.data.main.temp_max.toInt()}℃ • Night ${snapshot.data.main.temp_min.toInt()}℃",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(""),
                            Container(
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'http://openweathermap.org/img/wn/${snapshot.data.weather[0].icon}@2x.png',
                                ),
                                height: 66,
                                width: 66,
                              ),
                            ),
                            Text(
                              "Wind ${snapshot.data.wind.speed} kmph",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    constraints: BoxConstraints(maxHeight: 120, minHeight: 120),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        dailyForecast(
                            context, "Mon", Icons.wb_sunny_rounded, "18", "27"),
                        dailyForecast(
                            context, "Tue", Icons.wb_cloudy, "28", "27"),
                        dailyForecast(
                            context, "Wed", Icons.wb_shade, "9", "28"),
                        dailyForecast(
                            context, "Thu", Icons.wb_twighlight, "10", "37"),
                        dailyForecast(
                            context, "Fri", Icons.wb_sunny_rounded, "16", "27"),
                        dailyForecast(
                            context, "Sat", Icons.wb_sunny_rounded, "23", "21"),
                        dailyForecast(
                            context, "Sun", Icons.wb_sunny_rounded, "18", "27"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Unable To Fetch Data...");
        }

        // By default, show a loading spinner.
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Widget dailyForecast(BuildContext context, String day, IconData weatherIcon,
    String minTemp, String maxTemp) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        // color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            "${day}",
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Icon(
              weatherIcon,
              size: 40,
            ),
          ),
          Text(
            "${minTemp}/${maxTemp}℃",
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 14),
          )
        ],
      ),
    ),
  );
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
