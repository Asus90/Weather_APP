import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_tutorial/lib/core/const.dart';
import 'package:weather_app_tutorial/lib/domain/current_location/model/main.dart';
import 'package:weather_app_tutorial/lib/domain/home_page_model/home_page_model.dart';
import 'package:weather_app_tutorial/lib/failure/main_failure.dart';

class GetWether {
  Future<Either<Mainfailure, HomePageModel>> getWetherData({
    required String CityName,
  }) async {
    try {
      print(CityName);
      final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
      final response = await _wf.currentWeatherByCityName(CityName);
      final data = await _wf.currentWeatherByLocation(49.246292, 123.116226);
      print(data.areaName);

      print(response.areaName);
      if (response != null) {
        final HomePageModel data = HomePageModel(
            weatherdescription: response.weatherDescription!,
            wetherIcon: response.weatherIcon,
            name: response.areaName,
            date: response.date,
            windspeed: response.windSpeed,
            tembMax: response.tempMax,
            temperature: response.temperature,
            tembmain: response.tempMin,
            humidity: response.humidity,
            latitude: response.latitude,
            longitude: response.longitude);
        return right(data);
      } else {
        return left(Mainfailure.serverfailure());
      }
    } catch (e) {
      print(e);
      return left(Mainfailure.clintfailure());
    }
  }

  Future<Either<Mainfailure, CurrentLocationModel>> getCurrentLocation() async {
    try {
      final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      print("working on...");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      final response_currentLocation = await _wf.currentWeatherByLocation(
          position.altitude, position.longitude);
          print(response_currentLocation);
         


          if(response_currentLocation!=null){
            final CurrentLocationModel respose=CurrentLocationModel(area: response_currentLocation.areaName, lat: response_currentLocation.latitude , long: response_currentLocation.latitude);
            return right(respose);
            
          }else{
            return left(const Mainfailure.serverfailure());
          }
    } catch (e) {
      return left(const Mainfailure.clintfailure());
    }
  }
}
