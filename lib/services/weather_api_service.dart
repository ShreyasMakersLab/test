import 'package:crop_planning_techm/Models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url =
    'http://api.openweathermap.org/data/2.5/weather?q=pune&units=metric&appid=db66c78a5b437d17537bf3faf88e4418';

class WeatherAPIService {
  Future<WeatherModel> fetchData() async {
    http.Response data = await http.get(url);

    if (data.statusCode == 200) {
      Map weatherData = jsonDecode(data.body);

      return WeatherModel.fromJson(weatherData);
    } else {
      throw Exception("Unable to Fetch the Data");
    }
  }
}
