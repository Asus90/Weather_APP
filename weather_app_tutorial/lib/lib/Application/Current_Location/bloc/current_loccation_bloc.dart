
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_tutorial/lib/domain/current_location/model/main.dart';
import 'package:weather_app_tutorial/lib/failure/main_failure.dart';
import 'package:weather_app_tutorial/lib/infrastructure/wether_repository.dart';

part 'current_loccation_event.dart';
part 'current_loccation_state.dart';

class CurrentLoccationBloc
    extends Bloc<CurrentLoccationEvent, CurrentLoccationState> {
  CurrentLoccationBloc() : super(CurrentLoccationInitial()) {
   on<GetCurrentLOcation>((event, emit) async {
  emit(CurrentLoccationState(area: '', lat: '', long: '', isLoading: true, temMain: '', tembMAx: '', windspeed: ''));

  final response = await GetWether().getCurrentLocation();

  response.fold(
    (Mainfailure failure) {
      emit(CurrentLoccationState(
        temMain: '',
        tembMAx: '',
        windspeed: '',
        area: '',
        lat: '',
        isLoading: true,
        long: '',
      ));
    },
    (CurrentLocationModel result) {
      emit(CurrentLoccationState(
        temMain: result.tempMin,
        tembMAx: result.tempMax,
        windspeed: result.widspeed,
        area: result.area,
        lat: result.lat,
        isLoading: false,
        long: result.long,
      ));
    },
  );
});

  }
}
