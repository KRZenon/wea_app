class Weather {
  final String locationName;
  final String country;
  final String weather;
  final String description;
  final double currentlyTemp;
  final double tempFeelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;

  Weather ({
    required this.locationName,
    required this.country,
    required this.weather,
    required this.description,
    required this.currentlyTemp,
    required this.tempFeelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(locationName: json["name"],
        country: json["sys"]["country"],
        weather: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        currentlyTemp: json["main"]["temp"],
        tempFeelsLike: json["main"]["feels_like"],
        tempMin: json["main"]["temp_min"],
        tempMax: json["main"]["temp_max"],
        pressure: json["main"]["pressure"],
        humidity: json["main"]["humidity"],
        windSpeed: json["wind"]["speed"]
    );
  }
}