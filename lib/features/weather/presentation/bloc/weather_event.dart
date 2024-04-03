part of 'weather_bloc.dart';

sealed class WeatherEvent {}

class SearchWeatherEvent extends WeatherEvent {}
class ChangeLocationEvent extends WeatherEvent {
  final String location;

  ChangeLocationEvent({required this.location});
}
