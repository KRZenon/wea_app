part of 'weather_bloc.dart';

class WeatherState {
  final String location;
  final Option<Either<String, Weather>> weatherOrFailure;
  final String weatherPictureName;

  const WeatherState ({
    required this.location,
    required this.weatherOrFailure,
    required this.weatherPictureName,
});

  factory WeatherState.initial() => WeatherState(location: "", weatherOrFailure: none(), weatherPictureName: "");
  WeatherState copyWith({
    String? location,
    Option<Either<String, Weather>>? weatherOrFailure,
    String? weatherPictureName,
}) => WeatherState(location: location ?? this.location, weatherOrFailure: weatherOrFailure ?? this.weatherOrFailure, weatherPictureName: weatherPictureName ?? this.weatherPictureName,);
}

