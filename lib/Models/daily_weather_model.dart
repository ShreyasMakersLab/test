import 'package:crop_planning_techm/Models/Weather_description_model.dart';
import 'package:crop_planning_techm/Models/daily_temp_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_weather_model.g.dart';

@JsonSerializable()
class DailyWeatherModel {
  int dt;
  DailyTempModel temp;
  double wind_speed;
  List<WeatherDescriptionModel> weather;

  DailyWeatherModel({
    this.dt,
    this.temp,
    this.wind_speed,
    this.weather,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherModelToJson(this);
}
