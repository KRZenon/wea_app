import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:wa/features/weather/domain/use_case/weather_use_case.dart';


import '../../domain/entities/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCase weatherUseCase;
  WeatherBloc(this.weatherUseCase) : super(WeatherState.initial()) {
    on<ChangeLocationEvent>((event, emit) {
      emit(state.copyWith(location: event.location));
    });
    on<SearchWeatherEvent>((event, emit) async {
      final result = await weatherUseCase.call(state.location);
      late String img;
      result.fold((l) => null, (r) => img = getPictureName(r.weather));
      emit(state.copyWith(weatherOrFailure: some(result), weatherPictureName: img));
    });
  }

  String getPictureName(String weather) {
    switch (weather){
      case 'Clear':
        return 'clear.png';
      case 'Rain':
        return 'rain.png';
      case 'Snow':
        return 'snow.png';
      case 'Clouds':
        return 'clouds.png';
      case 'Haze':
        return 'haze.png';
    }
    return "";
  }
}
