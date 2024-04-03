import 'package:dartz/dartz.dart';

import '../entities/weather.dart';

abstract class WeatherRepo {
  Future<Either<String, Weather>> getWeather(String location);
}