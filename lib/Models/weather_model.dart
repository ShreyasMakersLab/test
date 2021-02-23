import 'package:crop_planning_techm/Models/wind_model.dart';

import 'Weather_description_model.dart';
import 'main_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  List<WeatherDescriptionModel> weather;
  MainModel main;
  WindModel wind;


  WeatherModel({this.weather, this.main,this.wind});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);


}


