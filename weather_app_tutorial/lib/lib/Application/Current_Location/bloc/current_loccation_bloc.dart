import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_tutorial/lib/domain/current_location/model/main.dart';
import 'package:weather_app_tutorial/lib/failure/main_failure.dart';
import 'package:weather_app_tutorial/lib/infrastructure/wether_repository.dart';

part 'current_loccation_event.dart';
part 'current_loccation_state.dart';

class CurrentLoccationBloc
    extends Bloc<CurrentLoccationEvent, CurrentLoccationState> {
  CurrentLoccationBloc() : super(CurrentLoccationInitial()) {
    on<GetCurrentLOcation>((event, emit) async {
      final response = await GetWether().getCurrentLocation();

      emit(CurrentLoccationState(area: '', lat: '', long: '', isLoading: true, temMain: '', tembMAx: '', windspeed: ''));
      final currentLocation = response.fold(
          (Mainfailure l) => emit(CurrentLoccationState(
            temMain: '',
            tembMAx: '',
            windspeed: '',
              area: '', lat: '', isLoading: true, long: '')),
          (CurrentLocationModel r) => emit(CurrentLoccationState(
            temMain: r.tempMin,
            tembMAx: r.tempMax,
            windspeed: r.widspeed,
              area: r.area, lat: r.lat, isLoading: false, long: r.long)));
    });
  }
}
