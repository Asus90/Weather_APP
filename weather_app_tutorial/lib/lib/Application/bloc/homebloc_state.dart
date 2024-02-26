part of 'homebloc_bloc.dart';

class HomeblocState {
  final String name;
  bool Islooding = false;
  final String date;
  final String wetherdescription;
  final String wetherIcon;
  var humidity;
  var tembmain;
  var tembmx;
  var windspeed;
  var latitude;
  var longtude;
  var latcurrent;
  var longcurrent;
  final area;
  HomeblocState(
      {required this.date,
      required this.tembmain,
      required this.tembmx,
      required this.area,
      required this.humidity,
      required this.latitude,
      required this.wetherdescription,
      required this.wetherIcon,
      required this.longtude,
      required this.longcurrent,
      required this.latcurrent,
      required this.windspeed,
      required this.Islooding,
      required this.name});
}

final class HomeblocInitial extends HomeblocState {
  HomeblocInitial()
      : super(
          wetherdescription: '',
          Islooding: false,
          latcurrent: '',
          area: '',
          longcurrent: '',
          wetherIcon: '',
          humidity: '',
          date: '',
          latitude: '',
          windspeed: '',
          longtude: '',
          name: '',
          tembmain: '',
          tembmx: '',
        );
}
