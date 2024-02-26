import 'package:json_annotation/json_annotation.dart';
 part 'main.g.dart';

@JsonSerializable()
class CurrentLocationModel {
  double? temp;
  int? pressure;
  int? humidity;
  var area;
  var lat;
  var long;
  var widspeed;
  int? tempMin;

  int? tempMax;

  CurrentLocationModel({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
    this.area,this.lat,this.long
  });

  factory CurrentLocationModel.fromJson(Map<String, dynamic> json) => _$CurrentLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLocationModelToJson(this);
}
