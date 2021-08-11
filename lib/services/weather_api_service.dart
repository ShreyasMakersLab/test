import 'dart:async';
import 'dart:convert';

import 'package:crop_planning_techm/Models/weather_model.dart';
import 'package:http/http.dart' as http;

String url =
    'https://api.openweathermap.org/data/2.5/onecall?lat=19.8762&lon=75.3433&units=metric&exclude=minutely,hourly&appid=5bf48301588e662cb1cee7422077ee54';

class WeatherAPIService {
  Future<WeatherModel> fetchData() async {
    http.Response data = await http.get(Uri.parse(url));

    if (data.statusCode == 200) {
      Map weatherData = jsonDecode(data.body);

      return WeatherModel.fromJson(weatherData);
    } else {
      throw Exception("Unable to Fetch the Data");
    }
  }
}
