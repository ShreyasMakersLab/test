import 'package:json_annotation/json_annotation.dart';

part 'daily_temp_model.g.dart';

@JsonSerializable()
class DailyTempModel {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  DailyTempModel(
      {this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory DailyTempModel.fromJson(Map<String, dynamic> json) =>
      _$DailyTempModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyTempModelToJson(this);
}
