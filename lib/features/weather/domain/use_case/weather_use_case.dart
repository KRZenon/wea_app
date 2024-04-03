import 'package:dartz/dartz.dart';
import 'package:wa/core/use_case/use_case.dart';
import 'package:wa/features/weather/domain/entities/weather.dart';
import 'package:wa/features/weather/domain/repositories/weather_repo.dart';

class WeatherUseCase implements FailureUseCase<Weather, String> {
  final WeatherRepo weatherRepo;
  WeatherUseCase(this.weatherRepo);
  @override
  Future<Either<String, Weather>> call(String location) {
    return weatherRepo.getWeather(location);
  }

}