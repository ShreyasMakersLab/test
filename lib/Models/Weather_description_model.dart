import 'package:json_annotation/json_annotation.dart';

part 'Weather_description_model.g.dart';

@JsonSerializable()
class WeatherDescriptionModel {
  double id;
  String main;
  String description;
  String icon;

  WeatherDescriptionModel({this.id, this.main, this.description, this.icon});

  factory WeatherDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDescriptionModelToJson(this);

}
