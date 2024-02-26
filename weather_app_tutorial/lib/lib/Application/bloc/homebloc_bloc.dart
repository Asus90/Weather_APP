import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_tutorial/lib/domain/home_page_model/home_page_model.dart';
import 'package:weather_app_tutorial/lib/failure/main_failure.dart';
import 'package:weather_app_tutorial/lib/infrastructure/wether_repository.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    final _Searchdata = GetWether();
    on<SearchWether>((event, emit) async {
      emit(HomeblocState(
          date: '',
          tembmain: '',
          tembmx: '',
          humidity: '',
          latitude: '',
          wetherdescription: '',
          wetherIcon: '',
          longtude: '',
          windspeed: '',
          Islooding: true,
          name: '',
          longcurrent: null,
          latcurrent: null,
          area: null));
      final Either<Mainfailure, HomePageModel> _result =
          await _Searchdata.getWetherData(CityName: event.data);

      _result.fold(
        (failure) {
          emit(HomeblocState(
            Islooding: true,
            name: '',
            date: '',
            tembmain: null,
            tembmx: null,
            latitude: null,
            longtude: null,
            wetherdescription: '',
            wetherIcon: '',
            humidity: null,
            windspeed: null,
            longcurrent: null,
            latcurrent: null,
            area: null,
          ));
        },
        (Success) {
          emit(HomeblocState(
              Islooding: false,
              name: Success.name!,
              date: Success.date.toString(),
              tembmain: Success.tembmain,
              latitude: Success.latitude,
              tembmx: Success.tembMax,
              longtude: Success.longitude,
              wetherdescription: Success.weatherdescription,
              wetherIcon: Success.wetherIcon!,
              humidity: Success.humidity,
              windspeed: Success.windspeed,
              longcurrent: null,
              latcurrent: null,
              area: null));
        },
      );
    });

    
  }
}
