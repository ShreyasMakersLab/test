import 'package:crop_planning_techm/Models/current_weather_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'daily_weather_model.dart';
import 'main_model.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  CurrentWeatherModel current;
  List<DailyWeatherModel> daily;

  WeatherModel({this.current, this.daily});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
