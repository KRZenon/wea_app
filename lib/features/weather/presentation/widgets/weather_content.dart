import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wa/core/const/constants.dart';
import 'package:wa/features/weather/presentation/widgets/temp_container.dart';
import 'package:wa/features/weather/presentation/widgets/weather_attribute.dart';

import '../../domain/entities/weather.dart';

class WeatherContent extends StatelessWidget {
  final Weather weather;
  final String weatherImageName;
  const WeatherContent({super.key, required this.weather, required this.weatherImageName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${weather.country}  / ${weather.locationName}",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(height: defaultPadding*2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset("assets/img/$weatherImageName",
                width: 200,
                ),
                Text(weather.description,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall,),
              ],
            )
          ],
        ),
        const SizedBox(height: defaultPadding *2,),
        TempContainer(
          label: "Current Temp",
          temp: weather.currentlyTemp.toString(),
          isCurrent: true,
        ),
        const SizedBox(height: defaultPadding,),
        Padding(
          padding:  EdgeInsets.only(bottom: defaultPadding * 2),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TempContainer(label: "Min temp", temp: weather.tempMin.toString()),
              TempContainer(label: "Max temp", temp: weather.tempMax.toString()),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherAttribute(
                icon: FontAwesomeIcons.water,
                value: "${weather.humidity}%",
                label: "Humidity",
              ),
              WeatherAttribute(
                icon: FontAwesomeIcons.wind,
                value: "${weather.windSpeed}km/h",
                label: "Wind Speed",
              ),
            ],
          ),
        )
      ],
    );
  }
}
