// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageModel _$HomePageModelFromJson(Map<String, dynamic> json) =>
    HomePageModel(
      longCurrent: json['longCurrent'],
      latCurrent: json['latCurrent'],
      temperature: json['temperature'],
      weatherdescription: json['weatherdescription'] as String,
      tembMax: json['tembMax'],
      tembmain: json['tembmain'],
      latitude: json['latitude'],
      windspeed: json['windspeed'],
      area: json['area'],
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      wetherIcon: json['wetherIcon'] as String?,
      humidity: json['humidity'],
      timezone: json['timezone'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      name: json['name'] as String?,
      longitude: json['longitude'],
    );

Map<String, dynamic> _$HomePageModelToJson(HomePageModel instance) =>
    <String, dynamic>{
      'tembmain': instance.tembmain,
      'weatherdescription': instance.weatherdescription,
      'temperature': instance.temperature,
      'tembMax': instance.tembMax,
      'latitude': instance.latitude,
      'area': instance.area,
      'latCurrent': instance.latCurrent,
      'longCurrent': instance.longCurrent,
      'windspeed': instance.windspeed,
      'clouds': instance.clouds,
      'wetherIcon': instance.wetherIcon,
      'humidity': instance.humidity,
      'timezone': instance.timezone,
      'date': instance.date?.toIso8601String(),
      'name': instance.name,
      'longitude': instance.longitude,
    };
