import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:wa/core/const/constants.dart';

import '../../domain/entities/weather.dart';

class WeatherRemoteDataSource {
  final Client client = Client();

  Future<Either<String, Weather>> getWeather(String location) async {
    var uri = Uri.parse("$url/data/2.5/weather?q=$location&units=metric&appid=$apiKey");
    var reponse = await client.get(uri);
    var json = jsonDecode(reponse.body);

    if(json["cod"] == 200) {
      return Right(Weather.fromJson(json));
    }else {
      return Left(json["message"]);
    }
  }
}