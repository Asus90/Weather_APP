import 'package:json_annotation/json_annotation.dart';

import 'clouds.dart';

part 'home_page_model.g.dart';

@JsonSerializable()
class HomePageModel {
  var tembmain;
  String weatherdescription;
  var temperature;
  var tembMax;
  var latitude;
  var area;
  var latCurrent;
  var longCurrent;
  var windspeed;

  Clouds? clouds;
  String? wetherIcon;
  var humidity;
  int? timezone;
  DateTime? date;
  String? name;
  var longitude;

  HomePageModel({
    this.longCurrent,
    this.latCurrent,
    this.temperature,
    required this.weatherdescription,
    this.tembMax,
    this.tembmain,
    this.latitude,
    this.windspeed,
    this.area,
    this.clouds,
    this.wetherIcon,
    this.humidity,
    this.timezone,
    this.date,
    this.name,
    this.longitude,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    return _$HomePageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomePageModelToJson(this);
}
