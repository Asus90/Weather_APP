// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'current_loccation_bloc.dart';

class CurrentLoccationState {
  var area;
  var lat;
  bool isLoading=false;
  var long;
  var windspeed;
  var temMain;
  var tembMAx;

  CurrentLoccationState({
    required this.area,
    required this.tembMAx,required this.temMain,required this.windspeed,
    required this.lat,
    required this.isLoading,
    required this.long,
  });
}

final class CurrentLoccationInitial extends CurrentLoccationState {
  CurrentLoccationInitial() : super(area: '', long: '', lat: '', isLoading:false, temMain: '', tembMAx: '', windspeed: '' );
}
