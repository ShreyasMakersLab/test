import 'package:crop_planning_techm/Models/Weather_description_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel {
  int dt;
  double temp;
  double wind_speed;
  List<WeatherDescriptionModel> weather;

  CurrentWeatherModel({this.dt, this.temp, this.wind_speed, this.weather});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}
