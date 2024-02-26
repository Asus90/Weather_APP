// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentLocationModel _$CurrentLocationModelFromJson(
        Map<String, dynamic> json) =>
    CurrentLocationModel(
      temp: (json['temp'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      tempMin: json['tempMin'] as int?,
      tempMax: json['tempMax'] as int?,
      area: json['area'],
      lat: json['lat'],
      long: json['long'],
    )..widspeed = json['widspeed'];

Map<String, dynamic> _$CurrentLocationModelToJson(
        CurrentLocationModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'area': instance.area,
      'lat': instance.lat,
      'long': instance.long,
      'widspeed': instance.widspeed,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
    };
