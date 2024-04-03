import 'package:dartz/dartz.dart';
import 'package:wa/features/weather/data/remote/weather_remote_data_source.dart';
import 'package:wa/features/weather/domain/entities/weather.dart';
import 'package:wa/features/weather/domain/repositories/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo{
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepoImpl(this.weatherRemoteDataSource);
  @override
  Future<Either<String, Weather>> getWeather(String location) {
    try {
      return weatherRemoteDataSource.getWeather(location);
    } catch (e) {
      rethrow;
    }
  }
}