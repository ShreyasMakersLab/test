import 'package:crop_planning_techm/Models/weather_model.dart';
import 'package:crop_planning_techm/services/weather_api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class WeatherCard extends StatefulWidget {
  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final WeatherAPIService weatherData = WeatherAPIService();

  bool _dropDownWeather = false;
  Widget selectedIcon = Icon(
    Icons.keyboard_arrow_down,
    size: 24,
  );

  List<Widget> dailyForecast(forecastData) {
    List<Widget> forecastList = [];

    for (var i = 0; i <= 6; i++) {
      forecastList.add(Align(
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
                "${DateFormat('EEE, MMM d, ' 'yy').format(DateTime.fromMillisecondsSinceEpoch(forecastData.daily[i].dt * 1000))}",
                style: Theme.of(context).textTheme.headline4,
              ),
              Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'http://openweathermap.org/img/wn/${forecastData.daily[i].weather[0].icon}@2x.png',
                ),
                height: 40,
                width: 40,
              ),
              Text(
                "${forecastData.daily[i].temp.max.toInt()}/${forecastData.daily[i].temp.min.toInt()}℃",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontSize: 14),
              )
            ],
          ),
        ),
      ));
    }
    return forecastList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModel>(
      future: weatherData.fetchData(),
      builder: (context, snapshot) {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${DateFormat('EEE d, MMM ').format(DateTime.fromMillisecondsSinceEpoch(snapshot.data.current.dt * 1000))}  ",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          "${snapshot.data.current.weather[0].description.capitalize()}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
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
                              "${snapshot.data.current.temp}℃",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(fontSize: 40),
                            ),
                            Text(
                              "Day ${snapshot.data.daily[0].temp.day.toInt()}℃ • Night ${snapshot.data.daily[0].temp.night.toInt()}℃",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'http://openweathermap.org/img/wn/${snapshot.data.current.weather[0].icon}@2x.png',
                                ),
                                height: 62,
                                width: 62,
                              ),
                            ),
                            Text(
                              "Wind ${snapshot.data.current.wind_speed} kmph",
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
                  Visibility(
                    maintainState: true,
                    visible: _dropDownWeather,
                    child: Container(
                      // padding: EdgeInsets.symmetric(horizontal: 8),
                      constraints:
                          BoxConstraints(maxHeight: 100, minHeight: 90),
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: dailyForecast(snapshot.data)),
                    ),
                  ),
                  Align(
                    child: IconButton(
                      iconSize: 24,
                      icon: selectedIcon,
                      onPressed: () {
                        setState(() {
                          if (_dropDownWeather == false) {
                            _dropDownWeather = true;
                            selectedIcon = Icon(
                              Icons.keyboard_arrow_up_outlined,
                              size: 24,
                            );
                          } else {
                            _dropDownWeather = false;
                            selectedIcon = Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 24,
                            );
                          }
                        });
                      },
                    ),
                  )
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
